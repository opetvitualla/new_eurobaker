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

}

	
