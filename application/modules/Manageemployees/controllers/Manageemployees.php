<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Manageemployees extends MY_Controller {

		public function index(){
			$data["title"] 		  = "List of Users";
			$data["page_name"]  = "List of Users";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";
			$data['outlets'] = $this->MY_Model->getRows('eb_outlets', $options = array(), 'row_array');

      $this->load_page('index',$data);
		}

    public function get_employees() {
      $limit        = $this->input->post('length');
      $offset       = $this->input->post('start');
      $search       = $this->input->post('search');
      $order        = $this->input->post('order');
      $draw         = $this->input->post('draw');
      $column_order = array(
                        'PK_user_id',
                        'firstname',
                        'email_address',
                        'date_added',
                      );
      $join         = array(
												'eb_users_meta'	=>	'eb_users_meta.FK_user_id = eb_users.PK_user_id',
											);
      $select       = "PK_user_id, firstname, lastname, branch_assigned, email_address, date_added";
      $where        = array('user_type !=' => 1);
      $group        = array();
      $list         = $this->MY_Model->get_datatables('eb_users',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

      $list_of_employees = array(
                            "draw" => $draw,
                            "recordsTotal" => $list['count_all'],
                            "recordsFiltered" => $list['count'],
                            "data" => $list['data']
                          );
      echo json_encode($list_of_employees);
    }

    public function add_employee() {
      $post         = $this->input->post();

      $data         = array(
                        'username' 				=> $post['username'],
                        'password' 				=> $post['password'],
                        'branch_assigned' => $post['outlet_id'],
                        'user_type' 			=> $post['user_type'],
                        'user_status'     => 1
                      );
      $insert_data  = $this->MY_Model->insert('eb_users',$data);

      if ($insert_data) {
				$insert_details	=	array(
														'FK_user_id'  	=> $insert_data,
														'firstname'  		=> $post['first_name'],
														'lastname'   		=> $post['last_name'],
														'email_address' => $post['email_address'],
														'age' 					=> $post['age'],
														'gender' 				=> $post['gender'],
														'address' 			=> $post['address'],
													);
				$insert_user_data  = $this->MY_Model->insert('eb_users_meta',$insert_details);
				if ($insert_user_data) {
					$response = array(
	                      'result' => 'success',
	                    );
				}

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
                            'PK_user_id' => $data_id
                          );
			$options['join']  = array(
														'eb_users_meta'	=>	'eb_users_meta.FK_user_id = eb_users.PK_user_id',
													);
      $data             = $this->MY_Model->getRows('eb_users', $options, 'row');
      echo json_encode($data);
    }

    public function update_details() {
      $data         = $this->input->post();
			// echo "<pre>";
			// print_r($data); exit;
			$data_user  	= array(
                        'username' 				=> $data['username'],
                        'password' 				=> $data['password'],
                        'branch_assigned' => $data['outlet_id'],
                        'user_type' 			=> $data['user_type'],
                      );
      $where_user  	= array(
                        'PK_user_id' => $data['user_id']
                      );
      $update_user  = $this->MY_Model->update('eb_users',$data_user,$where_user);
			$data_meta  	= array(
													'firstname'  		=> $data['first_name'],
													'lastname'   		=> $data['last_name'],
													'email_address' => $data['email_address'],
													'age' 					=> $data['age'],
													'gender' 				=> $data['gender'],
													'address' 			=> $data['address'],
												);
      $where_meta   = array(
                        'FK_user_id' => $data['user_id']
                      );
      $update_meta  = $this->MY_Model->update('eb_users_meta',$data_meta,$where_meta);

      if ($update_meta) {
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
