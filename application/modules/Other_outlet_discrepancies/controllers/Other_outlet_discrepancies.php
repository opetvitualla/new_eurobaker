<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Other_outlet_discrepancies extends MY_Controller {
	public function __construct() {
		parent::__construct();

	}
	
	public function index(){
		$data["title"] 	 	= "Discrepancy";
		$data["page_name"]  = "Discrepancy";
		$data['has_header'] = "includes/admin/header";
		$data['has_footer']	= "includes/index_footer";
		$data['has_modal'] = "modal/modal";
		
		$this->load_page('index',$data);
	}

	public function get_other_outlet_discrepancy(){
		$limit        = $this->input->post('length');
		$offset       = $this->input->post('start');
		$search       = $this->input->post('search');
		$order        = $this->input->post('order');
		$draw         = $this->input->post('draw');
		
		$column_order = array(
			'disc.fk_purchase_id',
			'disc.date_added',
			'user.firstname',
		);
		$join         = array(
			"eb_purchase_order po" 	=> "po.PK_purchase_order_id = disc.fk_purchase_id",
			"eb_users_meta user" 	=> "user.FK_user_id = po.FK_user_id",
		);
		$select       = "*";
		$where        = array(
			'disc.status ' => 1,
		);
		$group        = array();
		$list         = $this->MY_Model->get_datatables('eb_other_outlet_discrepancy disc', $column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);
		
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
			$par['where']  = array('fk_po_discrepancy_id' => $id);
			
			$getdata       = getData('eb_other_discrepancy_items', $par, 'obj');

			if(!empty($getdata)){

				$items["items"] = $getdata;

				$par['select'] = 'reason';
				$par['where']  = array('pk_other_discrepancy_id' => $id);

				$getdata2       = getData('eb_other_outlet_discrepancy', $par, 'obj');

				$items["reason"] = "";
				if(!empty($getdata2)){
					$items["reason"] = $getdata2[0]->reason;
				}
				

				$response = array('result'=>true, "data" => $items);
			}
		}

		echo json_encode($response);
	}

}