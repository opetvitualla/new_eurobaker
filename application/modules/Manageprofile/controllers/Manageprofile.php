<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Manageprofile extends MY_Controller {

	public function index(){
		$data["title"] 		  = "My Profile";
		$data["page_name"]  = "My Profile";
		$data['has_header'] = "includes/admin/header";
		$data['has_footer']	= "includes/index_footer";


		if(get_user_type() == 1){
			$this->load_page('index',$data);
		}
		else if(get_user_type() == 2){
			$this->load_purchaser_page('index',$data);
		}
		else if(get_user_type() == 3){
			$this->load_super_page('index',$data);
		}
		
	}

    public function view_details() {
      	$data_id          = $this->input->post('id');
      	$options['where'] = array( 'PK_user_id' => $data_id );
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
    	$where_user  	= array( 'PK_user_id' => $data['user_id'] );
		$update_user  = $this->MY_Model->update('eb_users',$data_user,$where_user);
		  
		$data_meta  	= array(
			'firstname'  		=> $data['first_name'],
			'lastname'   		=> $data['last_name'],
			'email_address' => $data['email_address'],
			'age' 					=> $data['age'],
			'gender' 				=> $data['gender'],
			'address' 			=> $data['address'],
		);

      	$where_meta   = array( 'FK_user_id' => $data['user_id'] );
      	$update_meta  = $this->MY_Model->update('eb_users_meta',$data_meta,$where_meta);

		if ($update_meta) {
			$response = array( 'result' => 'success', );
		} else {
			$response = array( 'result' => 'error', );
		}

      	echo json_encode($response);
    }

    public function update_profile (){
	  
		$response = array("status" => "error", "message" =>"something wrong!");

		$post = $this->input->post();

		$user_id  = $this->session->userdata("PK_user_id");

		if(!empty($post)){

			if($this->is_exist($post, $user_id)){
				$response = array("status" => "error", "message" =>"username or email address is already exist!");
			}
			else{
				$set   = array('username' => $post["username"], 'password' => $post["password"],);
				$where = array('PK_user_id' => $user_id);
				
				updateData('eb_users', $set, $where);

				$set   = array(
					'firstname' => $post["firstname"], 
					'lastname' => $post["lastname"],
					'email_address' => $post["email"],
					'address' => $post["address"],
					'age' => $post["age"],
				);
				$where = array('FK_user_id' => $user_id);
				
				updateData('eb_users_meta', $set, $where);

				$response = array("status" => "success", "message" =>"success");
				$this->update_session($user_id);
			}
			
		}

		echo json_encode($response);

	}
	
	private function is_exist ($post,  $user_id){
		
		$res = false;

		$par['select'] = 'username';
		$par['where']  = array(
			'PK_user_id != ' => $user_id,
			'username' => $post["username"],
		);
		
		$getdata       = getData('eb_users', $par, 'obj');

		if(empty($getdata)){

			$par['select'] = 'email_address';
			$par['where']  = array(
				'FK_user_id != ' => $user_id,
				'email_address' => $post["email"],
			);
		
			$getdata       = getData('eb_users_meta', $par, 'obj');

			$res = !empty($getdata);
		}else{
			$res = true;
		}
		

		return $res;
	}


	private function update_session ($user_id){
		
		$par["select"] = "*";
		$par["where"] = array(
			"user.PK_user_id"	=> $user_id,
			"user.user_status" 	=> 1
		);

		$par["join"] = array(
			"eb_users_meta u_meta" => "u_meta.FK_user_id = user.PK_user_id",
			"eb_outlets outlet" => "outlet.PK_branch_id = user.branch_assigned",
			
		);

		$user_data =  getData("eb_users user", $par);
		if(!empty($user_data)){
			$user_data[0]["is_logged"] = true;

			$this->session->set_userdata($user_data[0]);
		}

	}


}
