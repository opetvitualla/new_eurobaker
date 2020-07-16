<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Manageoutlets extends MY_Controller {
			public function __construct() {
					parent::__construct();

			}

		public function index(){
			$data["title"] 		  = "Manage Outlets";
			$data["page_name"]  = "Manage Outlets";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			if (get_user_type() == 1) {
				$this->load_page('index',$data);
			} else {
				$this->load_purchaser_page('index',$data);
			}

		}

		public function get_outlets() {
			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');
			$column_order = array(
												'PK_branch_id',
												'outlet_name',
											);
			$join         = array();
			$select       = "PK_branch_id, outlet_name, status";
			$where        = array(
												'status' => 1,
											);
			$group        = array();
			$list         = $this->MY_Model->get_datatables('EB_outlets',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

			$list_of_outlets = array(
														"draw" => $draw,
														"recordsTotal" => $list['count_all'],
														"recordsFiltered" => $list['count'],
														"data" => $list['data']
													);
			echo json_encode($list_of_outlets);
		}

		public function add_outlet() {
			$post         = $this->input->post();
			$data         = array(
												'outlet_name'  => $post['outlet_name'],
												'status'         => 1
											);
			$insert_data  = $this->MY_Model->insert('EB_outlets',$data);

			if ($insert_data) {
				$response = array(
											'result' => 'success',
										);
			} else {
				$response = array(
											'result' => 'error',
										);
			}
			echo json_encode($response);
		}

		public function view_details() {
			$data_id          = $this->input->post('id');
			$options['where'] = array(
														'PK_branch_id' => $data_id
													);
			$data             = $this->MY_Model->getRows('EB_outlets', $options, 'row');
			echo json_encode($data);
		}

		public function update_details() {
			$data         = $this->input->post();
			$set          = array(
												'outlet_name'  => $data['outlet_name'],
											);
			$where        = array(
												'PK_branch_id' => $data['id']
											);
			$update_data  = $this->MY_Model->update('EB_outlets',$set,$where);

			if ($update_data) {
				$response = array(
											'result' => 'success',
										);
			} else {
				$response = array(
											'result' => 'error',
										);
			}
			echo json_encode($response);
		}
}
