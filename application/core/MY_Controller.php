<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class MY_Controller extends MX_Controller {

	public function __construct(){

		$route = $this->router->fetch_class();

		if($route == 'login'){
			if($this->session->has_userdata('is_logged')){
				redirect(base_url());
			}
		}

		else {
			if(!$this->session->has_userdata('is_logged')){
				redirect(base_url('login'));
			}
		}

	}

	public function load_login_page($page, $data = array()){
		$this->load->view('login/header',$data);
		$this->load->view($page, $data);
		$this->load->view('login/footer',$data);
	}

	public function load_purchaser_page($page, $data = array()){
		$this->load->view('includes/purchaser/head',$data);
		$this->load->view('includes/purchaser/header',$data);
		$this->load->view('includes/purchaser/sidebar',$data);
		$this->load->view($page, $data);
		$this->load->view('includes/purchaser/footer',$data);
	}

	public function load_super_page($page, $data = array()){
		$this->load->view('includes/supervisor/head',$data);
		$this->load->view('includes/supervisor/header',$data);
		$this->load->view('includes/supervisor/sidebar',$data);
		$this->load->view($page, $data);
		$this->load->view('includes/supervisor/footer',$data);
	}

	public function load_page($page, $data = array()){

		// $stocks = _count_stock_transfer();
		$this->load->view('includes/admin/head',$data);
		$this->load->view('includes/admin/header',$data);
		$this->load->view('includes/admin/sidebar',$data);
		$this->load->view($page, $data);
		$this->load->view('includes/admin/footer',$data);
	}



}
