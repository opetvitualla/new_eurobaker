<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Manageprofile extends MY_Controller {

		public function index(){
			$data["title"] 		  = "My Profile";
			$data["page_name"]  = "My Profile";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

      $this->load_page('index',$data);
		}

    public function viewDetails() {
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

    public function updateDetails() {
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
