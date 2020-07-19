<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stock_transfer_discrepancy extends MY_Controller {
	public function __construct() {
		parent::__construct();

	}
	
	public function index(){
		$data["title"] 	 	= "Discrepancy";
		$data["page_name"]  = "Discrepancy";
		$data['has_header'] = "includes/admin/header";
		$data['has_footer']	= "includes/index_footer";
		$data['has_modal'] = "modal/modal";
		
		if (get_user_type() == 1) {
			$this->load_page('index',$data);
		}else{
			redirect(base_url());
		} 
	}

	public function get_discrepancy(){
		$limit        = $this->input->post('length');
		$offset       = $this->input->post('start');
		$search       = $this->input->post('search');
		$order        = $this->input->post('order');
		$draw         = $this->input->post('draw');
		
		$column_order = array(
			'std.fk_transfer_id',
			'std.date_added',
			'user.firstname',
		);
		$join         = array(
			"eb_stock_transfer st" 	=> "st.PK_stock_transfer_id = std.fk_transfer_id",
			"eb_users_meta user" 	=> "user.FK_user_id = st.FK_user_id",
		);
		$select       = "std.fk_transfer_id, std.date_added, user.firstname";
		$where        = array(
			'std.status ' => 1,
			'st.FK_destination_branch_id ' =>_get_branch_assigned(),
		);
		$group        = array();
		$list         = $this->MY_Model->get_datatables('eb_stock_transfer_discrepancy std', $column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);
		
		$list_results = array(
			"draw" => $draw,
			"recordsTotal" => $list['count_all'],
			"recordsFiltered" => $list['count'],
			"data" => $list['data']
		);
		echo json_encode($list_results);
	}

	public function get_descripancy_items ($id = 0){
	
		$response = array('result'=>false);
		$items = array();

		if($id != 0){

			$par['select'] = '*';
			$par['where']  = array('fk_transfer_id' => $id);
			
			$std_data       = getData('eb_stock_transfer_discrepancy', $par, 'obj');

			if(!empty($std_data)){

				$std_id = $std_data[0]->pk_st_discrepancy_id;

				$par['select'] = '*';
				$par['where']  = array('fk_st_discrepancy_id' => $std_id);
				
				$getdata       = getData('eb_st_discrepancy_items', $par, 'obj');

				$items["items"] = $getdata;
				$items["st_disc_data"] = $std_data;
				$items["receiver"] = $this->get_receiver_user($id);

				$response = array('result'=>true, "data" => $items);

			}
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

	private function get_st_details ($st_id){
		
		$res = ["app_data" => array(), "so_data" => array()];

		$par['select'] = 'firstname, lastname, counter_checked, date_approved';
		$par['where']  = array('fk_stockout_id' => $st_id);
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

