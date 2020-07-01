<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Managesuppliers extends MY_Controller {

		public function index(){
			$data["title"] 		  = "List of Suppliers";
			$data["page_name"]  = "List of Suppliers";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			if (get_user_type() == 1) {
          $this->load_page('index',$data);
      }
      else {
          $this->load_purchaser_page('index',$data);
      }

		}

    public function getSuppliers() {
      $limit        = $this->input->post('length');
      $offset       = $this->input->post('start');
      $search       = $this->input->post('search');
      $order        = $this->input->post('order');
      $draw         = $this->input->post('draw');
      $column_order = array(
                        'PK_supplier_id',
                        'supplier_name',
                        'address',
                        'terms',
                        'status',
                        'date_added',
                      );
      $join         = array();
      $select       = "PK_supplier_id, supplier_name, address, terms, status, date_added";
      $where        = array(
                        'status' => 1,
                      );
      $group        = array();
      $list         = $this->MY_Model->get_datatables('eb_suppliers',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

      $list_of_suppliers = array(
                            "draw" => $draw,
                            "recordsTotal" => $list['count_all'],
                            "recordsFiltered" => $list['count'],
                            "data" => $list['data']
                          );
      echo json_encode($list_of_suppliers);
    }

    public function addSupplier() {
      $post         = $this->input->post();
      $data         = array(
                        'supplier_name'  => $post['supplier_name'],
                        'address'        => $post['address'],
                        'terms' 				 => $post['terms'],
                        'products' 			 => $post['products'],
                        'status'         => 1
                      );
      $insert_data  = $this->MY_Model->insert('eb_suppliers',$data);

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

    public function viewDetails() {
      $data_id          = $this->input->post('id');
      $options['where'] = array(
                            'PK_supplier_id' => $data_id
                          );
      $data             = $this->MY_Model->getRows('eb_suppliers', $options, 'row');
      echo json_encode($data);
    }

    public function updateDetails() {
      $data         = $this->input->post();
      $set          = array(
                        'supplier_name'  => $data['supplier_name'],
                        'address'        => $data['address'],
												'terms' 					 => $data['terms'],
                        'products' 			 => $data['products'],
                      );
      $where        = array(
                        'PK_supplier_id' => $data['id']
                      );
      $update_data  = $this->MY_Model->update('eb_suppliers',$set,$where);

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
