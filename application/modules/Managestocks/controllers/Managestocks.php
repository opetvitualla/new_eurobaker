<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Managestocks extends MY_Controller {
			public function __construct() {
					parent::__construct();
			}

		public function index(){


		}

    public function StockTransfer() {
      $data["title"] 		  = "Stock Transfer";
			$data["page_name"]  = "Stock Transfer";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('stocktransfer',$data);
    }

		public function get_stock_transfer() {
			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');
			$column_order = array(
												'PK_stock_transfer_id',
												'outlet_name',
												'stock_out',
												'eb_stock_transfer.status',
												'eb_stock_transfer.date_added',
											);
			$join         = array(
												"eb_outlets" => "eb_outlets.PK_branch_id = eb_stock_transfer.FK_destination_branch_id"
											);
			$select       = "PK_stock_transfer_id, FK_destination_branch_id,outlet_name, stock_out, eb_stock_transfer.status, eb_stock_transfer.date_added";
			$where        = array(
												'FK_destination_branch_id' => _get_outlet_assigned()// current outlet id
											);
			$group        = array();
			$list         = $this->MY_Model->get_datatables('eb_stock_transfer',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

			$list_of_stock_transfer = array(
																	"draw" => $draw,
																	"recordsTotal" => $list['count_all'],
																	"recordsFiltered" => $list['count'],
																	"data" => $list['data']
																);
			echo json_encode($list_of_stock_transfer);
		}

		public function save_stock_transfer() {
			$transfer = $this->input->post();

			if(!empty($transfer)){

				$data = array(
					"FK_user_id" 	  => 1, // change if naa nay user
					"FK_origin_branch_id" 	  => 1,
					"FK_destination_branch_id" 	  => $transfer['destination_branch_id'],
					"stock_out" 	  => $transfer['total_items'],
					'str_no'			=>	$transfer['str_no'],
					"status"		  => 0,
				);

				$transfer_id = insertData("eb_stock_transfer", $data); // insert transfer

				if ($transfer_id) {
					$items = json_decode($transfer["po_items"]);

					foreach ($items as $item) {
						$data = array(
							"FK_stock_transfer_id" 		=> $transfer_id,
							"FK_raw_material_id" 	=> $item->item_id,
							"quantity" 				=> $item->quantity,
							"status" 				=> 0,
						);

						$options['select']= 'sales_price'; //get price
						$options['where'] = array('PK_raw_materials_id'=>$item->item_id); //check price
						$prev_price 			= $this->MY_Model->getRows('eb_raw_materials_list', $options , 'row');
						$current_price		=	$item->price;

						if ($prev_price->sales_price != $current_price) {
							$data_price = array(
								"FK_raw_material_id"=> $item->item_id,
								"previous_price" 	  => $prev_price->sales_price,
								"current_price" 	  => $current_price,
							);
							$insert_price = insertData("eb_raw_materials_price_logs", $data_price);


						}

						$insert_items = insertData("eb_stock_transfer_items", $data);
						if ($insert_items) {
							$response = array( "result" => "success" );
						} else {
							$response = array( "result" => "something went wrong" );
						}
					}


				} else {
					$response = array( "result" => "error" );

				}
				echo json_encode($response);
			}
		}

		public function get_transferred_details($transferred_id) {
			$response = array("result" => "error");

			if(!empty($transferred_id)){

				$par["select"] 	= "*";
				$par["where"]	= "eb_stock_transfer.PK_stock_transfer_id = {$transferred_id}";
				$par["join"] 	= array(
													"eb_stock_transfer_items" => "eb_stock_transfer_items.FK_stock_transfer_id = eb_stock_transfer.PK_stock_transfer_id",
												);

				$transferred_data = getData("eb_stock_transfer", $par, "obj");

				if(!empty($transferred_data)){

					$destination_id          = $this->input->post('id');
					$options['where'] = array(
																'PK_branch_id' => $transferred_data[0]->FK_destination_branch_id
															);
					$destination    = $this->MY_Model->getRows('eb_outlets', $options, 'row');
					// echo "<pre>";print_r($destination['outlet_name']);exit;

					$par["select"] 	= "*";
					$par["where"]	= "eb_stock_transfer_items.FK_stock_transfer_id = {$transferred_id}";
					$par["join"] 	= array(
														"eb_raw_materials" => "eb_raw_materials.PK_raw_materials_id = eb_stock_transfer_items.FK_raw_material_id",
													);

					$transferred_items = getData("eb_stock_transfer_items", $par, "obj");

					if(!empty($transferred_items)){
						$transferred_data[0]->{"po_items"} = $transferred_items;
						$transferred_data[0]->destination  = $destination->outlet_name;
					}
				}

				$response = array("result" => "success", "data" =>$transferred_data );
			}
			echo json_encode($response);
		}

		public function delivered_transfer() {
			$transferred_id = $this->input->post('transferred_id');
			$actual_quantity= $this->input->post('actual_quantity');

			$response 			= array("result" => "error");

			if(!empty($transferred_id)){
				$par["select"]			= "PK_transfer_item_id, FK_stock_transfer_id, PK_raw_materials_id, sales_price, quantity, FK_origin_branch_id, FK_destination_branch_id";
				$par["where"]				= "eb_stock_transfer_items.FK_stock_transfer_id = {$transferred_id}";
				$par["join"] 				= array(
																"eb_raw_materials" => "eb_raw_materials.PK_raw_materials_id = eb_stock_transfer_items.FK_raw_material_id",
																"eb_stock_transfer"=> "eb_stock_transfer_items.FK_stock_transfer_id = eb_stock_transfer.PK_stock_transfer_id"
															);

				$transferred_items 	= getData("eb_stock_transfer_items", $par, "row_array");

				foreach ($transferred_items as $item) {
					$stock_in['where'] 	 					= array(
																						'FK_raw_material_id' => $item['PK_raw_materials_id'],
																						'FK_outlet_id' => $item['FK_destination_branch_id']
																					);
					$stock_in['order'] 	 					= 'date_added DESC';
					$stock_in_data			 					=	$this->MY_Model->getRows('eb_item_inventory', $stock_in, 'row_array');
					$stock_in_beginning_inventory = $stock_in_data[0]['quantity'];
					$stock_in_expected_qty				=	$stock_in_beginning_inventory + $item['quantity'];
					$stock_in_qty									=	$stock_in_beginning_inventory + $actual_quantity;
					$stock_in_amount							=	$stock_in_qty * $item['sales_price'];
					$stock_in_discrepancy				 	=	0;

					if ($item['quantity'] != $actual_quantity) {
						$stock_in_discrepancy = 1;
					}

					if (empty($stock_in_data)) {
							$transfer_to	=	array(
																'FK_raw_material_id'	=> 	$item['PK_raw_materials_id'],
																'FK_outlet_id' 				=> 	$item['FK_destination_branch_id'],
																'amount'							=>	$stock_in_amount,
																'beginning_inventory'	=>	$stock_in_qty,
																'expected_quantity'		=>	$stock_in_expected_qty,
																'quantity'						=>	$stock_in_qty,
																'discrepancy'					=>	$stock_in_discrepancy,
																'status'							=>	1,
																'type'								=> 'Stock Transfer'
															);
					} else {
							$transfer_to	=	array(
																'FK_raw_material_id'	=> 	$item['PK_raw_materials_id'],
																'FK_outlet_id' 				=> 	$item['FK_destination_branch_id'],
																'amount'							=>	$stock_in_amount,
																'beginning_inventory'	=>	$stock_in_beginning_inventory,
																'expected_quantity'		=>	$stock_in_expected_qty,
																'quantity'						=>	$stock_in_qty,
																'discrepancy'					=>	$stock_in_discrepancy,
																'status'							=>	1,
																'type'								=> 'Stock Transfer'
															);
					}

					$stock_out['where'] 	 					= array(
																							'FK_raw_material_id' => $item['PK_raw_materials_id'],
																							'FK_outlet_id' => $item['FK_origin_branch_id']
																						);
					$stock_out['order'] 	 					= 'date_added DESC';
					$stock_out_data			 						=	$this->MY_Model->getRows('eb_item_inventory', $stock_out, 'row_array');
					$stock_out_beginning_inventory 	= $stock_out_data[0]['quantity'];
					$stock_out_expected_qty					=	$stock_out_beginning_inventory - $item['quantity'];
					$stock_out_qty									=	$stock_out_beginning_inventory - $actual_quantity;
					$stock_out_amount								=	$stock_out_qty * $item['sales_price'];

					$transfer_from									=	array(
																							'FK_raw_material_id'	=> 	$item['PK_raw_materials_id'],
																							'FK_outlet_id' 				=> 	$item['FK_destination_branch_id'],
																							'amount'							=>	$stock_out_amount,
																							'beginning_inventory'	=>	$stock_out_beginning_inventory,
																							'expected_quantity'		=>	$stock_out_expected_qty,
																							'quantity'						=>	$stock_out_qty,
																							'discrepancy'					=>	0,
																							'status'							=>	1,
																							'type'								=> 'Stock Transfer'
																						);


					$insert_STOCK_IN	=	insertData("eb_item_inventory", $transfer_to); // insert transfer items to inventory
					$insert_STOCK_OUT	=	insertData("eb_item_inventory", $transfer_from); // insert transfer items to inventory
				}

				$set = array(
					"status" => 1,
					"received_by" => $this->input->post('received_by'),
					"counterchecked_by" => $this->input->post('counterchecked_by'), 
				);
				$where = array( "PK_stock_transfer_id" => $transferred_id );

				updateData("eb_stock_transfer", $set, $where);

				$response = array("result" => "success");
			}
			echo json_encode($response);
		}

    public function StockOut() {
      $data["title"] 		  = "Stock Out";
			$data["page_name"]  = "Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('stockout',$data);
    }

    public function StockAdjustments() {
      $data["title"] 		  = "Stock Adjustment";
			$data["page_name"]  = "Stock Adjustment";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('stockadjustments',$data);
    }

		public function get_stock_discrepancy() {
			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');
			$column_order = array(
												'PK_inventory_id',
												'material_name',
												'expected_quantity',
												'quantity',
												'eb_item_inventory.date_added',
											);
			$join         = array(
												"eb_raw_materials" => "eb_raw_materials.PK_raw_materials_id = eb_item_inventory.FK_raw_material_id"
											);
			$select       = "PK_inventory_id, FK_raw_material_id, material_name, expected_quantity, quantity, discrepancy, eb_item_inventory.date_added";
			$where        = array(
												'discrepancy'	=>	1,
											);
			$group        = array();
			$list         = $this->MY_Model->get_datatables('eb_item_inventory',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

			$list_of_raw_materials = array(
																	"draw" => $draw,
																	"recordsTotal" => $list['count_all'],
																	"recordsFiltered" => $list['count'],
																	"data" => $list['data']
																);
			echo json_encode($list_of_raw_materials);
		}

		public function viewDetailsAdjustments() {
			$data_id          	= $this->input->post('id');
			$options['select'] = array(
														'PK_inventory_id',
														'material_name',
														'amount',
														'beginning_inventory',
														'expected_quantity',
														'quantity',
														'type',
														'eb_item_inventory.status',
														'eb_item_inventory.date_added',
														'eb_item_inventory.date_updated',
													);
			$options['where'] = array(
														'PK_inventory_id' => $data_id
													);
			$options['join'] = array(
														"eb_raw_materials" => "eb_raw_materials.PK_raw_materials_id = eb_item_inventory.FK_raw_material_id"
													);
			$data             = $this->MY_Model->getRows('eb_item_inventory', $options, 'row');
			echo json_encode($data);
		}

}
