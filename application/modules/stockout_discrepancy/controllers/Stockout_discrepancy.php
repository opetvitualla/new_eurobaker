<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stockout_discrepancy extends MY_Controller {
	public function __construct() {
		parent::__construct();

	}
	
	public function index(){
		$data["title"] 	 	= "Stock Out Discrepancy";
		$data["page_name"]  = "Stock Out Discrepancy";
		$data['has_header'] = "includes/admin/header";
		$data['has_footer']	= "includes/index_footer";
		$data['has_modal'] = "modal/modal";
		
		if (get_user_type() == 1) {
			$this->load_page('index',$data);
		} 
	}

	public function get_stock_out_discrepancy(){
		$limit        = $this->input->post('length');
		$offset       = $this->input->post('start');
		$search       = $this->input->post('search');
		$order        = $this->input->post('order');
		$draw         = $this->input->post('draw');
		
		$column_order = array(
			'sod.fk_stock_out_id',
			'sod.date_added',
			'user.firstname',
		);
		$join         = array(
			"eb_stock_out so" 	=> "so.PK_stock_out_id = sod.fk_stock_out_id",
			"eb_users_meta user" 	=> "user.FK_user_id = so.FK_user_id",
		);
		$select       = "sod.fk_stock_out_id, sod.date_added, user.firstname";
		$where        = array(
			'sod.status ' => 1,
			'so.FK_outlet_id ' =>_get_branch_assigned(),
		);
		$group        = array();
		$list         = $this->MY_Model->get_datatables('eb_stock_out_discrepancy sod', $column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);
		
		$list_results = array(
			"draw" => $draw,
			"recordsTotal" => $list['count_all'],
			"recordsFiltered" => $list['count'],
			"data" => $list['data']
		);
		echo json_encode($list_results);
	}

	public function get_descripancy ($id = 0){
	
		$response = array('result'=>false);
		$items = array();

		if($id != 0){

			$par['select'] = '*';
			$par['where']  = array('fk_so_discrepancy_id' => $id);
			
			$getdata       = getData('eb_so_discrepancy_items', $par, 'obj');

			if(!empty($getdata)){

				$items["items"] = $getdata;

				$par['select'] = 'reason';
				$par['where']  = array('fk_stock_out_id' => $id);

				$getdata2       = getData('eb_stock_out_discrepancy', $par, 'obj');

				$items["reason"] = "";

				if(!empty($getdata2)){
					$items["reason"] = $getdata2[0]->reason;
				}
				
				$items["so_disc_data"] = $this->get_so_details($id);

				$response = array('result'=>true, "data" => $items);
			}
		}

		echo json_encode($response);
	}

	private function get_so_details ($so_id){
		
		$res = ["app_data" => array(), "so_data" => array()];

		$par['select'] = 'firstname, lastname, counter_checked, date_approved';
		$par['where']  = array('fk_stockout_id' => $so_id);
		$par["join"] 	= array(
			"eb_users_meta user_meta" => "user_meta.FK_user_id = so_app.fk_approve_user_id",
		);
		$app_data       = getData('eb_stock_out_approved so_app', $par, 'obj');


		$par['select'] = '*';
		$par['where']  = array('PK_stock_out_id' => $so_id, "so.status" => "approved");
		$par["join"] 	= array(
			"eb_users_meta user_meta" => "user_meta.FK_user_id = so.fk_requested_id",
			"eb_segment seg" => "seg.PK_segment_id = so.FK_segment_id",
		);
		$so_data       = getData('eb_stock_out so', $par, 'obj');

		$res = ["app_data" => $app_data[0], "so_data" => $so_data[0]];

		return $res;
		
	}

}

