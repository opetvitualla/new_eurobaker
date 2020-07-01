<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends MY_Controller {

		public function __construct(){
			parent::__construct();
			date_default_timezone_set('Asia/Manila');
		}

		public function index(){
			$data["title"] 		="Login";
			$data["page_name"]  ="Login";
			$this->load_login_page('index', $data);
		}

		public function forgot_password(){
			$data["title"] 		="Forgot password";
			$data["page_name"]  ="forgot_password";
			$this->load_login_page('forgot_password', $data);
		}

		public function update_password(){	

			if(empty($_GET["token"])){
				redirect(base_url("login/"));
			}

			$token = $_GET["token"];

			$date_today = date("Y-m-d");

			$par["where"] = "token_value = '{$token}' AND date_expire >  '{$date_today}'";
			
			$get_data = getData("eb_forgot_password_keys", $par, "obj");

			if(empty($get_data)){
				redirect(base_url("login/"));
			}

			$data["title"] 		="Update Password";
			$data["page_name"]  ="update_password";
			$this->load_login_page('update_password', $data);
		}

		public function update_password_process(){

			$link 		= $_SERVER["HTTP_REFERER"];
			$post 	  	=  $this->input->post();
			$pass	  	= $post["password"];
			$con_pass 	= $post["con_password"];

			if(empty($pass) || empty($con_pass)){
				swal_data("Please input the required fields!", "error");
			}
			else if($pass != $con_pass){
				swal_data("Password doesnt match!", "error");
			}
			else if(strlen($pass) < 6){
				swal_data("Password must be greater than five characters", "error");
			}
			else{

				$token 		  = $post["token"];

				$par["where"] = "token_value = '{$token}'";
			
				$get_data	  = getData("eb_forgot_password_keys", $par, "obj");
				if(empty($get_data)){
					swal_data("Update password failed!", "error");
				}
				else{
					$set 	= array( "password" => $pass );
					$where  = array("PK_user_id" => $get_data[0]->FK_user_id);
					updateData("eb_users", $set, $where);
					
					deleteData("eb_forgot_password_keys", array("FK_user_id" => $get_data[0]->FK_user_id));
					swal_data("Password Updated Successfully", "success");
					$link = base_url("login");
				}

			}
			
			redirect($link);
			
		}

		public function forgot_password_process(){

			$email 		=  $this->input->post("email");

			if(empty($email)){
				swal_data("Please input the required fields!", "error");
				redirect(base_url("login/forgot_password"));
			}
			else{

				$par["select"] = "*";
				$par["where"] = array(
					"email_address"	=> $email,
				);

				$user_data = getData("eb_users_meta", $par, "obj");

				if(empty($user_data)){
					swal_data("This email address is not registered!", "error");
					redirect(base_url("login/forgot_password"));
				}
				else{

					$cur_date 	= date('Y-m-d');
					$where 		=  array("email_address" => $email, "date_expire <=" => "{$cur_date}");

					deleteData("eb_forgot_password_keys", $where);

					$par["select"] = "email_address";
					$par["where"] = array(
						"email_address"	=> $email,
					);

					$has_email = getData("eb_forgot_password_keys", $par, "obj");

					if(!empty($has_email)){
						swal_data("We have already sent you the link on your email address!", "error");
						redirect(base_url("login/forgot_password"));
					}

					$permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
					$strkey = substr(str_shuffle($permitted_chars),0 ,40);
					$msglink = base_url('login/update_password'). "/?token=".$strkey;
					
					$content ="Hi, <strong>".$user_data[0]->firstname."</strong> <br/> <br/>";
					$content .= "Please confirm your password by clicking the link below: <br/> ".  $msglink;
					
					if(sendemail($email, $content, "Forgot Password")){

						
						$exp_date = date('Y-m-d', strtotime("+1 day"));
						
						$set = array(
							"FK_user_id" => $user_data[0]->FK_user_id,
							"email_address" => $email,
							"token_value" => $strkey,
							"status" => 1,
							"date_expire" => $exp_date,
							"date_added" => date("Y-m-d h:i:s")
						);
						
						insertData("eb_forgot_password_keys", $set);
						swal_data("Please check your email to verify your password.", "success");
					}
					else{
						swal_data("unable to send email", "error");
					}
					redirect(base_url("login/forgot_password"));
				}

			}

		}




		public function send_test(){
			
			// sendemail("web2.juphetvitualla@gmail.com", "sample", "Forgot Password");
		}

		public function login_process(){

			$post 		= $this->input->post();
			$username	= $post["username"];
			$password 	= $post["password"];

			if(empty($username) || empty($password)){
				swal_data("Please input the required fields!");
			}
			else{ // process login
				$par["select"] = "*";
				$par["where"] = array(
					"user.username"		=> $username,
					"user.password" 	=> $password,
					"user.user_status" 	=> 1
				);

				$par["join"] = array(
					"eb_users_meta u_meta" => "u_meta.FK_user_id = user.PK_user_id"
				);

			  	$user_data =  getData("eb_users user", $par);
				if(empty($user_data)){
					
					swal_data("Incorrect Username Password", "error");
					redirect(base_url("login"));
				}

				else{
					$user_data[0]["is_logged"] = true;

					$this->session->set_userdata($user_data[0]);
					redirect(base_url());
				
				}

		}

	}

	public function testt (){

		echo '<pre>';
		print_r($this->session->userdata());
		echo '</pre>';
		exit;
	}

}
