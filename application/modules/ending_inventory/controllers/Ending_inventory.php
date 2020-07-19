<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Ending_inventory extends MY_Controller {

	public function __construct() {
			parent::__construct();
	}

	public function index(){
		$data["title"] 		= "Ending Inventory";
		$data["page_name"]  = "Ending Inventory";
		$data['has_header'] = "includes/admin/header";
		// $data['has_modal'] = "modal/modal";
		$data['has_footer']	= "includes/index_footer";


		if (get_user_type() == 1) {
			$this->load_page('index',$data);
		} 
		else if (get_user_type() == 2) {
			redirect(base_url());
		}

	}


}
