<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Logout extends MY_Controller {


		public function index(){
			$session_data = array( "PK_user_id", "username", "user_type", "user_status", "date_added", "user_status", "PK_user_meta_id", "FK_user_id", "firstname", "lastname","email_address", "age",  "gender", "address", "is_logged");
			$this->session->unset_userdata($session_data);
			
			redirect(base_url('login'));
		}

}
