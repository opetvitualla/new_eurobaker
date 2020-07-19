<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Managestocks extends MY_Controller {

	public function __construct() {
			parent::__construct();
	}

	public function index(){
		redirect(base_url("managestocks/stocktransfer"));
	}

    public function stocktransfer() {
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
				"FK_user_id" 	  		  	=> my_user_id(), // change if naa nay user
				"FK_origin_branch_id" 	  	=> _get_branch_assigned(),
				"FK_destination_branch_id" 	=> $transfer['destination_branch_id'],
				"stock_out" 	  			=> $transfer['total_items'],
				'str_no'		  			=>  $transfer['str_no'],
				"status"		  			=> 0,
				"total_amount"	  			=> $transfer["over_total"]
			);

			$transfer_id = insertData("eb_stock_transfer", $data); // insert transfer

			if ($transfer_id) {
				$items = json_decode($transfer["po_items"]);

				foreach ($items as $item) {
					$data = array(
						"FK_stock_transfer_id" 	=> $transfer_id,
						"FK_raw_material_id" 	=> $item->item_id,
						"quantity" 				=> $item->quantity,
						"status" 				=> 0,
						"total"					=> $item->total,
						"item_unit"				=> $item->unit
					);

					$options['select']= 'sales_price'; //get price

					$options['where'] = array('PK_raw_materials_id'=>$item->item_id); //check price
					$prev_price 		= $this->MY_Model->getRows('eb_raw_materials_list', $options , 'row');
					$current_price		=	$item->price;

					if ($prev_price->sales_price != $current_price) {
						$data_price = array(
							"FK_raw_material_id"=> $item->item_id,
							"previous_price" 	  => $prev_price->sales_price,
							"current_price" 	  => $current_price,
							'outlet_id' => _get_branch_assigned()
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
				$options['where'] = array( 'PK_branch_id' => $transferred_data[0]->FK_destination_branch_id );
				$destination    = $this->MY_Model->getRows('eb_outlets', $options, 'row');
				// echo "<pre>";print_r($destination['outlet_name']);exit;

				$par["select"] 	= "*";
				$par["where"]	= "eb_stock_transfer_items.FK_stock_transfer_id = {$transferred_id}";
				$par["join"] 	= array(
					"eb_raw_materials_list mat" => "mat.PK_raw_materials_id = eb_stock_transfer_items.FK_raw_material_id",
				);

				$transferred_items = getData("eb_stock_transfer_items", $par, "obj");

				if(!empty($transferred_items)){
					$transferred_data[0]->{"po_items"} = $transferred_items;
					$transferred_data[0]->destination  = $destination->outlet_name;
					$transferred_data[0]->received  = $this->get_receiver_user($transferred_id);
				}
			}

			$response = array("result" => "success", "data" =>$transferred_data );
		}

		echo json_encode($response);

	}

	private function get_receiver_user ($id){
		
		$par['select'] = '*';
		$par['where']  = array('FK_transfer_id' => $id);
		$par["join"] 	= array(
			"eb_users_meta user_meta" => "user_meta.FK_user_id = st_rec.FK_received_user_id",
		);
		
		$getdata       = getData('eb_stock_transfer_received st_rec', $par, 'obj');

		return $getdata[0];

	}

	private function check_related_items ($items = [], $trans_id){
		
		$par['select'] = 'FK_destination_branch_id';
		$par['where']  = array('PK_stock_transfer_id' => $trans_id);
		
		$getdata       = getData('eb_stock_transfer', $par, 'obj');

		if(!empty($getdata)){

			$destination_branch = $getdata[0]->FK_destination_branch_id;

			if(!empty($items)){
				foreach ($items as $item) {
					$par['select'] = '*';
					$par['where']  = array(
						'related_item_id' => $item->rel_id,
						'FK_outlet_id' => $destination_branch,
					);
					
					$getdata       = getData('eb_raw_materials_list', $par, 'obj');

					if(empty($getdata)){
						$this->create_new_product($item, $item->rel_id, $trans_id); //insert new product to destination outlet
					}
				}
			}
		}

	}

	private function create_new_product ($item, $rel_id, $trans_id){

		$par['select'] = 'FK_origin_branch_id';
		$par['where']  = array('PK_stock_transfer_id' => $trans_id);
		$origin        = getData('eb_stock_transfer', $par, 'obj');

		$par['select'] = '*';
		$par['where']  = array(
			'FK_outlet_id' => $origin[0]->FK_origin_branch_id,
			'related_item_id' => $rel_id,
		);
		
		$getdata       = getData('eb_raw_materials_list', $par, 'obj');

		if(!empty($getdata)){

			$data         = array(
				'FK_outlet_id'        => _get_branch_assigned(),
				'material_name'       => $getdata[0]->material_name,
				'FK_category_id'      => $getdata[0]->FK_category_id,
				'unit'                => $getdata[0]->unit,
				'sales_price'         => $getdata[0]->sales_price,
				'min_stock'           => $getdata[0]->min_stock,
				'related_item_id'	  => $rel_id,
				'status'              => 1,
				'date_added'          => date("Y-m-d"),
			);
			
			$insert_data  = $this->MY_Model->insert('eb_raw_materials_list', $data);

			if (!empty($insert_data)) {
				$item->{"latest_id"} = $insert_data;
				$this->insert_inventory($item);
			} 
		}

	}

	private function insert_inventory($post = array()){

		$data = array(
			'FK_raw_material_id' => $post->latest_id,
			'FK_outlet_id' => _get_branch_assigned(),
			'beginning_inventory' => 0,
			'quantity' => 0,
			'status' => 1,
			'type' => "initial",
			"discrepancy" => 0,
			"date_added" => date("Y-m-d"),
			"date_updated" => date("Y-m-d")
		);

		insertData('eb_item_inventory', $data);

		$data = array(
			'fk_item_id' =>  $post->latest_id,
			'type_entry' => "initial",
			'trans_id' => 0,
			'from_value' =>  0,
			'value' =>  0,
			"branch_id" => _get_branch_assigned(),
			"date_added" => date("Y-m-d"),
			"cal_type" => "add",
		);

		insertData('eb_inventory_movement', $data);

	}
	

	public function receive_transfered_items (){
		
		$post 	  = $this->input->post();

		$response = array("result" => "error");

		$st_id = $post["st_id"];
		$counter_chker = $post["counter_check"];

		$all_items = [];

		if(!empty($post["disc_item"])){
			$disc_items = json_decode($post["disc_item"]);
		}
		if(!empty($post["all_items"])){
			$all_items = json_decode($post["all_items"]);
		}

		// update orgin inventory
		if(!empty($all_items)){
			$this->check_related_items($all_items, $st_id); // checck if not exist and add 
			$this->update_inventory_from_outlet($all_items, $st_id); //update inventory from origin
			$this->update_inventory_destination_outlet($all_items, $st_id); //update destination inventory
		}

		if(!empty($st_id)){
			$data = array(
				"FK_transfer_id" => $st_id,
				"FK_received_user_id" => my_user_id(),
				"status" => 1,
				"counter_checked" => $counter_chker,
				"date_received" => date("Y-m-d")
			);

			insertData("eb_stock_transfer_received", $data);

			$set = array( "status" => 1);
			$where = array( "PK_stock_transfer_id" => $st_id );

			updateData("eb_stock_transfer", $set, $where);

			if(!empty($disc_items)){
				$data = array(
					"fk_transfer_id" => $st_id,
					"status" => 1,
					"reason" => $post["reason"],
					"date_added" => date("Y-m-d")
				);

				$disc_id = insertData("eb_stock_transfer_discrepancy", $data);

				foreach ($disc_items as $item) {
					$data = array(
						"fk_st_discrepancy_id" => $disc_id,
						"fk_material_id" => $item->item_id,
						"material_name" => $item->item_name,
						"qty" => $item->quantity,
						"received_qty" => $item->rec_qty,
						"units" => $item->units,
						"date_added" => date("Y-m-d")
					);

					insertData("eb_st_discrepancy_items", $data);
				}

			}

			$response = array("result" => "success");
		}

		echo json_encode($response);

	}
	
	private function update_inventory_from_outlet($items = array(), $trans_id= 0){

		$par['select'] = 'FK_origin_branch_id';
		$par['where']  = array('PK_stock_transfer_id' => $trans_id);
		$getdata       = getData('eb_stock_transfer', $par, 'obj');

		if(!empty($getdata)){

			$origin_branch = $getdata[0]->FK_origin_branch_id;

			if(!empty($items)){
				foreach ($items as $item) {

					$par['select'] = 'quantity';
					$par['where']  = array( 'FK_raw_material_id' => $item->rel_id, 'FK_outlet_id' => $origin_branch );
					$qty_data= getData('eb_item_inventory', $par, 'obj');

					$qty =0;       
					if(!empty($qty_data)){
						$qty = $qty_data[0]->quantity;   
					}

					$set = array(
						'quantity' => $qty -  $item->rec_qty,
						'type' => "transfer",
						"date_updated" => date("Y-m-d")
					);

					$where = array(
						'FK_raw_material_id' => $item->item_id,
						'FK_outlet_id' => $origin_branch,
					);
					
					updateData('eb_item_inventory', $set, $where);

					$data = array(
						'fk_item_id' =>  $item->item_id,
						'type_entry' => "transfer",
						'trans_id' => $trans_id,
						'from_value' =>  $qty,
						'value' =>  $item->rec_qty,
						"branch_id" => $origin_branch,
						"date_added" => date("Y-m-d"),
						"cal_type"	 => "sub"
					);

					insertData('eb_inventory_movement', $data);
				}
			}
		}
	}

	private function get_mat_id ($rel_id){
		
		$par['select'] = 'PK_raw_materials_id';
		$par['where']  = array(
			'related_item_id' => $rel_id,
			'FK_outlet_id' => _get_branch_assigned(),
		);
		
		$getdata       = getData('eb_raw_materials_list', $par, 'obj');

		return $getdata[0]->PK_raw_materials_id;

	}

	private function update_inventory_destination_outlet($items = array(), $trans_id= 0){

		if(!empty($items)){
			foreach ($items as $item) {

				$item_id = $this->get_mat_id($item->rel_id);

				$par['select'] = 'quantity';
				$par['where']  = array( 'FK_raw_material_id' => $item_id, 'FK_outlet_id' => _get_branch_assigned() );
				$qty_data= getData('eb_item_inventory', $par, 'obj');

				$qty =0;       
				if(!empty($qty_data)){
					$qty = $qty_data[0]->quantity;   
				}

				$set = array(
					'quantity' => $qty +  $item->rec_qty,
					'type' => "transfer",
					"date_updated" => date("Y-m-d")
				);

				$where = array(
					'FK_raw_material_id' => $item_id,
					'FK_outlet_id' => _get_branch_assigned(),
				);
				
				updateData('eb_item_inventory', $set, $where);

				$data = array(
					'fk_item_id' =>  $item_id,
					'type_entry' => "transfer",
					'trans_id' => $trans_id,
					'from_value' =>  $qty,
					'value' =>  $item->rec_qty,
					"branch_id" => _get_branch_assigned(),
					"date_added" => date("Y-m-d"),
					"cal_type"	 => "add"
				);

				insertData('eb_inventory_movement', $data);
			}
		}
	}
	
	public function delivered_transfer() {
		$transferred_id = $this->input->post('transferred_id');
		$actual_quantity= $this->input->post('actual_quantity');

		$response 			= array("result" => "error");


		if(!empty($transferred_id)){
			$par["select"]	= "PK_transfer_item_id, FK_stock_transfer_id, PK_raw_materials_id, sales_price, quantity, FK_origin_branch_id, FK_destination_branch_id";
			$par["where"]	= "eb_stock_transfer_items.FK_stock_transfer_id = {$transferred_id}";
			$par["join"] 	= array(
				"eb_raw_materials_list mat" => "mat.PK_raw_materials_id = eb_stock_transfer_items.FK_raw_material_id",
				"eb_stock_transfer"=> "eb_stock_transfer_items.FK_stock_transfer_id = eb_stock_transfer.PK_stock_transfer_id"
			);

			$transferred_items 	= getData("eb_stock_transfer_items", $par, "row_array");

			foreach ($transferred_items as $item) {
				$stock_in['where'] 	= array(
					'FK_raw_material_id' => $item['PK_raw_materials_id'],
					'FK_outlet_id' => $item['FK_destination_branch_id']
				);

				$stock_in['order'] 	 		  = 'date_added DESC';
				$stock_in_data			 	  =	$this->MY_Model->getRows('eb_item_inventory', $stock_in, 'row_array');
				$stock_in_beginning_inventory = $stock_in_data[0]['quantity'];
				$stock_in_expected_qty		  =	$stock_in_beginning_inventory + $item['quantity'];
				$stock_in_qty				  =	$stock_in_beginning_inventory + $actual_quantity;
				$stock_in_amount			  =	$stock_in_qty * $item['sales_price'];
				$stock_in_discrepancy		  =	0;

				if ($item['quantity'] != $actual_quantity) {
					$stock_in_discrepancy = 1;
				}

				if (empty($stock_in_data)) {
						$transfer_to	=	array(
							'FK_raw_material_id'	=> 	$item['PK_raw_materials_id'],
							'FK_outlet_id' 			=> 	$item['FK_destination_branch_id'],
							'amount'				=>	$stock_in_amount,
							'beginning_inventory'	=>	$stock_in_qty,
							'expected_quantity'		=>	$stock_in_expected_qty,
							'quantity'				=>	$stock_in_qty,
							'discrepancy'			=>	$stock_in_discrepancy,
							'status'				=>	1,
							'type'					=> 'Stock Transfer'
						);
				} 
				else {
						$transfer_to	=	array(
							'FK_raw_material_id'	=> 	$item['PK_raw_materials_id'],
							'FK_outlet_id' 			=> 	$item['FK_destination_branch_id'],
							'amount'				=>	$stock_in_amount,
							'beginning_inventory'	=>	$stock_in_beginning_inventory,
							'expected_quantity'		=>	$stock_in_expected_qty,
							'quantity'				=>	$stock_in_qty,
							'discrepancy'			=>	$stock_in_discrepancy,
							'status'				=>	1,
							'type'					=> 'Stock Transfer'
						);
				}

				$stock_out['where'] = array(
					'FK_raw_material_id' => $item['PK_raw_materials_id'],
					'FK_outlet_id' => $item['FK_origin_branch_id']
				);

				$stock_out['order'] 	 		= 'date_added DESC';
				$stock_out_data			 	    = $this->MY_Model->getRows('eb_item_inventory', $stock_out, 'row_array');
				$stock_out_beginning_inventory 	= $stock_out_data[0]['quantity'];
				$stock_out_expected_qty			= $stock_out_beginning_inventory - $item['quantity'];
				$stock_out_qty					= $stock_out_beginning_inventory - $actual_quantity;
				$stock_out_amount				= $stock_out_qty * $item['sales_price'];

				$transfer_from	=	array(
					'FK_raw_material_id'	=> 	$item['PK_raw_materials_id'],
					'FK_outlet_id' 			=> 	$item['FK_destination_branch_id'],
					'amount'				=>	$stock_out_amount,
					'beginning_inventory'	=>	$stock_out_beginning_inventory,
					'expected_quantity'		=>	$stock_out_expected_qty,
					'quantity'				=>	$stock_out_qty,
					'discrepancy'			=>	0,
					'status'				=>	1,
					'type'					=> 'Stock Transfer'
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
			"eb_raw_materials_list" => "mat.PK_raw_materials_id = eb_item_inventory.FK_raw_material_id"
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
		$options['where'] = array( 'PK_inventory_id' => $data_id );

		$options['join'] = array(
			"eb_raw_materials_list" => "mat.PK_raw_materials_id = eb_item_inventory.FK_raw_material_id"
		);
		$data   = $this->MY_Model->getRows('eb_item_inventory', $options, 'row');
		
		echo json_encode($data);
	}

	public function get_item_unit($unit = ""){

		$response = array("status" => "error");

		if($unit != ""){

			$par['select'] = 'PK_unit_id, unit_name';
			$par['where']  = array('unit_name' => $unit);
			
			$getdata       = getData('eb_units', $par, 'obj');

			if(!empty($getdata)){
				$response = array("status" => "success", "data" => $getdata[0]);
			}
		}
		echo json_encode($response);

	}	

}
