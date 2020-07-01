<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Total_purchase_order extends MY_Controller {
		public function __construct() {
				parent::__construct();
		}

		public function index(){
			$data["title"] 		= "Total Purchase";
			$data["page_name"]  = "Total Purchase";
			$data['has_header'] = "includes/admin/header";
			// $data['has_modal'] = "modal/modal";
			$data['has_footer']	= "includes/index_footer";

			$par["select"] = "*";
			$par["where"] = array(
				"FK_branch_id" => _get_branch_assigned(),
				"status" => 1,
			);

			$segment = getData("eb_segment", $par, "obj");
			
			$data["segments"] = $segment;

			if (get_user_type() == 1) {
				$this->load_page('index',$data);
			} 
			else if (get_user_type() == 2) {
				redirect(base_url());
			}
			else{
				$this->load_super_page('index_supervisor',$data);
			}
		}

		public function get_purchase_data(){

			
			$date_from = $this->input->post('date_from');
			$date_to = $this->input->post('date_to');

			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');

			
			$column_order = array(
				'PK_purchase_order_id',
				'outlet.outlet_name',
				'sup.supplier_name',
				'po.total_amount',
				'po.status',
				'po_rec.date_received'
			);
			$join         = array(
				"eb_suppliers sup" => "sup.PK_supplier_id = po.FK_supplier_id",
				"eb_outlets outlet" => "outlet.PK_branch_id = po.FK_branch_id",
				"eb_purchase_order_received po_rec" => "po_rec.FK_purchase_id = po.PK_purchase_order_id",
			);
			$select       = "PK_purchase_order_id, outlet.outlet_name, sup.supplier_name, po.status, po_rec.date_received, po.total_amount";
			$where        = array(
				'po.status !=' => "deleted",
			);

			if(!empty($date_from) && !empty($date_to)){
				$where        = array(
					'po.status !=' => "deleted",
					"po_rec.date_received >=" => $date_from,
					"po_rec.date_received <=" => $date_to,
				);
			}

			$group        = array();
			$list         = $this->MY_Model->get_datatables('eb_purchase_order po',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);
			
			$list_purchase_order = array(
				"draw" => $draw,
				"recordsTotal" => $list['count_all'],
				"recordsFiltered" => $list['count'],
				"data" => $list['data']
			);

			echo json_encode($list_purchase_order);

		}
}
