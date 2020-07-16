<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Managereports extends MY_Controller {
			public function __construct() {
					parent::__construct();
			}

		public function index(){


		}

    public function TotalPurchases() {
      $data["title"] 		  = "Total Purchases";
			$data["page_name"]  = "Total Purchases";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('totalpurchases',$data);
    }

    public function TotalUsed() {
      $data["title"] 		  = "Total Used / Stock Out";
			$data["page_name"]  = "Total Used / Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('totalused',$data);
    }

    public function EndingInventory() {
      $data["title"] 		  = "Ending Inventory";
			$data["page_name"]  = "Ending Inventory";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('endinginventory',$data);
    }

	public function get_ending_inventory() {
		$date		=	!empty($this->input->post('ymonth')) ? $this->input->post('ymonth') : date('Y-m');
		$outlet_id 		= 2;

		$limit        = $this->input->post('length');
		$offset       = $this->input->post('start');
		$search       = $this->input->post('search');
		$order        = $this->input->post('order');
		$draw         = $this->input->post('draw');
		$column_order = array(
			'raw.`PK_raw_materials_id',
			'raw.`material_name',
			'inv.`beginning_inventory',
			'inv.`quantity',
			'inv.`date_added'
		);
		$join         = array(
							"eb_item_inventory inv" => "inv.`FK_raw_material_id` = raw.`PK_raw_materials_id`"
						);
		$select       = "raw.`PK_raw_materials_id`, raw.`material_name`, inv.`FK_raw_material_id`, inv.`beginning_inventory`, inv.`quantity`, inv.`date_added`";
		$where        = "(SELECT max(`date_added`) FROM `eb_item_inventory` AS maxdate WHERE maxdate.`FK_raw_material_id`=raw.`PK_raw_materials_id` && date_format( `date_added`, '%Y-%m' ) = '$date' && `FK_outlet_id`='$outlet_id' LIMIT 1)=inv.`date_added`";
		$group        = array();
		$list         = $this->MY_Model->get_datatables('eb_raw_materials raw',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

		$list_of_ending = array(
			"draw" => $draw,
			"recordsTotal" => $list['count_all'],
			"recordsFiltered" => $list['count'],
			"data" => $list['data']
		);
		echo json_encode($list_of_ending);
	}

		public function generateEndingInventory() {
				$date 										= $this->input->post('date');
				$outlet_id								= 2; //Outlet session

				$storData 								= 	array();
				$metaData[] 							= 	array(
						'PK_raw_materials_id' => 'Raw Material ID',
						'material_name' 			=> 'Name',
						'beginning_inventory' => 'Beginning Inventory',
						'quantity' 						=> 'Current Inventory',
						'date_added' 					=> 'Date Added',
				);
				$options['select'] 				= 	'raw.`PK_raw_materials_id`, raw.`material_name`, inv.`FK_raw_material_id`, inv.`beginning_inventory`, inv.`quantity`, inv.`date_added`';
				$options['where'] 				= 	"(SELECT max(`date_added`) FROM `eb_item_inventory` AS maxdate WHERE maxdate.`FK_raw_material_id`=raw.`PK_raw_materials_id` && date_format( `date_added`, '%Y-%m' ) = '$date' && `FK_outlet_id`='$outlet_id' LIMIT 1)=inv.`date_added`";
				$options['join'] 					= array(
																				"eb_item_inventory inv" => "inv.`FK_raw_material_id` = raw.`PK_raw_materials_id`"
																		);

				$generateData 						= $this->MY_Model->getRows('eb_raw_materials raw', $options);

				foreach($generateData as $key=>$element) {
						$storData[] 								= array(
								'PK_raw_materials_id' 	=> 'IT-'.$element['PK_raw_materials_id'],
								'material_name' 				=> $element['material_name'],
								'beginning_inventory' 	=> $element['beginning_inventory'],
								'quantity' 							=> $element['quantity'],
								'date_added' 						=> $element['date_added']
						);
				}
				$data 	= array_merge($metaData,$storData);
				header("Content-type: application/csv");
				header("Content-Disposition: attachment; filename=\"Reports".".csv\"");
				header("Pragma: no-cache");
				header("Expires: 0");
				$handle = fopen('php://output', 'w');
				foreach ($data as $data) {
						fputcsv($handle, $data);
				}
						fclose($handle);
				exit;
		}

    public function StockForTransfer() {
      		$data["title"] 		  = "Stock Transfer Reports";
			$data["page_name"]  = "Stock Transfer Reports";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('stocktransfer',$data);
    }

		public function get_transfer_reports() {
			$date_start		=	!empty($this->input->post('date_start')) ? $this->input->post('date_start') : date('Y-m-d');
			$date_end			=	!empty($this->input->post('date_end')) ? $this->input->post('date_end') : date('Y-m-d');
			$outlet_id 		= 1;

			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');
			$column_order = array(
												'PK_stock_transfer_id',
												'outlet_name',
												'stock_out',
												'eb_stock_transfer.date_added',
											);
			$join         = array(
												'eb_outlets'	=>	'eb_outlets.PK_branch_id=eb_stock_transfer.FK_destination_branch_id'
											);
			$select       = "PK_stock_transfer_id, FK_destination_branch_id, outlet_name, stock_out, eb_stock_transfer.status, eb_stock_transfer.date_added";
			$where        = "eb_stock_transfer.status=0 AND FK_origin_branch_id='$outlet_id' AND eb_stock_transfer.date_added BETWEEN '$date_start' AND '$date_end' OR eb_stock_transfer.status=0 AND FK_destination_branch_id='$outlet_id' AND eb_stock_transfer.date_added BETWEEN '$date_start' AND '$date_end'";
			$group        = array();
			$list         = $this->MY_Model->get_datatables('eb_stock_transfer',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

			$list_of_pending = array(
																	"draw" => $draw,
																	"recordsTotal" => $list['count_all'],
																	"recordsFiltered" => $list['count'],
																	"data" => $list['data']
																);
			echo json_encode($list_of_pending);
		}

		// export Data
		public function generateTransferReports() {
			$date_start = $this->input->post('date_start');
			$date_end 	= $this->input->post('date_end');
			$outlet_id	= 1; //Outlet session

			$storData = array();
			$metaData[] = array(
					'PK_stock_transfer_id' => 'Transfer ID',
					'outlet_name' => 'Outlet Name',
					'stock_out' => 'Total Items',
					'date_added' => 'Date',
			);
			$options['select'] = 'PK_stock_transfer_id, FK_destination_branch_id, outlet_name, stock_out, eb_stock_transfer.status, eb_stock_transfer.date_added';
			$options['where'] = "eb_stock_transfer.status=0 AND FK_origin_branch_id='$outlet_id' AND eb_stock_transfer.date_added BETWEEN '$date_start' AND '$date_end' OR eb_stock_transfer.status=0 AND FK_destination_branch_id='$outlet_id' AND eb_stock_transfer.date_added BETWEEN '$date_start' AND '$date_end'";
			$options['join'] = array(
					'eb_outlets' => 'eb_stock_transfer.FK_destination_branch_id = eb_outlets.PK_branch_id',
			);

			$generateData = $this->MY_Model->getRows('eb_stock_transfer', $options);

			foreach($generateData as $key=>$element) {
					$storData[] = array(
							'PK_stock_transfer_id' => 'TR-'.$element['PK_stock_transfer_id'],
							'outlet_name' => $element['outlet_name'],
							'stock_out' => $element['stock_out'],
							'date_added' => $element['date_added']
					);
			}
			$data = array_merge($metaData,$storData);
			header("Content-type: application/csv");
			header("Content-Disposition: attachment; filename=\"Reports".".csv\"");
			header("Pragma: no-cache");
			header("Expires: 0");
			$handle = fopen('php://output', 'w');
			foreach ($data as $data) {
					fputcsv($handle, $data);
			}
					fclose($handle);
			exit;
		}

		// export Data
		public function generateReports() {
				$report = $this->input->post();

				$storData = array();
				$metaData[] = array(
						'PK_stock_transfer_id' => 'Transfer ID',
						'outlet_name' => 'Transferred To',
						'stock_out' => 'Total Items',
				);
				$options['select'] = 'PK_stock_transfer_id, stock_out, FK_destination_branch_id, outlet_name';
				$options['where'] = array(
						// 'checked_date' => $remarks['ymonth_remarks'],
						'FK_origin_branch_id' => 1, //Outlet session
				);
				$options['join'] = array(
						'eb_outlets' => 'eb_stock_transfer.FK_destination_branch_id = eb_outlets.PK_branch_id',
				);

				$generateData = $this->MY_Model->getRows('eb_stock_transfer', $options);

				foreach($generateData as $key=>$element) {
						$storData[] = array(
								'PK_stock_transfer_id' => 'TR-'.$element['PK_stock_transfer_id'],
								'outlet_name' => $element['outlet_name'],
								'stock_out' => $element['stock_out']
						);
				}
				$data = array_merge($metaData,$storData);
				header("Content-type: application/csv");
				header("Content-Disposition: attachment; filename=\"Reports".".csv\"");
				header("Pragma: no-cache");
				header("Expires: 0");
				$handle = fopen('php://output', 'w');
				foreach ($data as $data) {
						fputcsv($handle, $data);
				}
						fclose($handle);
				exit;
		}

    public function PendingDeliveries() {
      $data["title"] 		  = "Pending Deliveries";
			$data["page_name"]  = "Pending Deliveries";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('pendingdeliveries',$data);
    }

    public function get_pending_deliveries() {
			$date_start		=	!empty($this->input->post('date_start')) ? $this->input->post('date_start') : date('Y-m-d');
			$date_end			=	!empty($this->input->post('date_end')) ? $this->input->post('date_end') : date('Y-m-d');
			$type 				= 'Stock Transfer';
			$outlet_id 		= 1;

			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');
			$column_order = array(
			                  'PK_stock_transfer_id',
			                  'stock_out',
			                  'date_added',
			                );
			$join         = array();
			$select       = "PK_stock_transfer_id, FK_destination_branch_id, stock_out, status, date_added";
			$where        = "status=0 AND FK_origin_branch_id='$outlet_id' AND `date_added` BETWEEN '$date_start' AND '$date_end' OR status=0 AND FK_destination_branch_id='$outlet_id' AND `date_added` BETWEEN '$date_start' AND '$date_end'";
			$group        = array();
			$list         = $this->MY_Model->get_datatables('eb_stock_transfer',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

      $list_of_pending = array(
                                  "draw" => $draw,
                                  "recordsTotal" => $list['count_all'],
                                  "recordsFiltered" => $list['count'],
                                  "data" => $list['data']
                                );
      echo json_encode($list_of_pending);
    }

		public function generatePendingReports() {
				$date_start = $this->input->post('date_start');
				$date_end 	= $this->input->post('date_end');
				$outlet_id	= 1; //Outlet session

				$storData = array();
				$metaData[] = array(
						'PK_stock_transfer_id' => 'Transfer ID',
						'outlet_name' => 'Transferred To',
						'stock_out' => 'Total Items',
				);
				$options['select'] = 'PK_stock_transfer_id, stock_out, FK_destination_branch_id, outlet_name';
				$options['where'] = "eb_stock_transfer.status=0 AND FK_origin_branch_id='$outlet_id' AND eb_stock_transfer.date_added BETWEEN '$date_start' AND '$date_end' OR eb_stock_transfer.status=0 AND FK_destination_branch_id='$outlet_id' AND eb_stock_transfer.date_added BETWEEN '$date_start' AND '$date_end'";
				$options['join'] = array(
						'eb_outlets' => 'eb_stock_transfer.FK_destination_branch_id = eb_outlets.PK_branch_id',
				);

				$generateData = $this->MY_Model->getRows('eb_stock_transfer', $options);

				foreach($generateData as $key=>$element) {
						$storData[] = array(
								'PK_stock_transfer_id' => 'TR-'.$element['PK_stock_transfer_id'],
								'outlet_name' => $element['outlet_name'],
								'stock_out' => $element['stock_out']
						);
				}
				$data = array_merge($metaData,$storData);
				header("Content-type: application/csv");
				header("Content-Disposition: attachment; filename=\"Reports".".csv\"");
				header("Pragma: no-cache");
				header("Expires: 0");
				$handle = fopen('php://output', 'w');
				foreach ($data as $data) {
						fputcsv($handle, $data);
				}
						fclose($handle);
				exit;
		}

    public function Discrepancies() {
      $data["title"] 		  = "Total Used / Stock Out";
			$data["page_name"]  = "Total Used / Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('totalused',$data);
    }

}
