<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ManageReports extends MY_Controller {
			public function __construct() {
					parent::__construct();
			}

		public function index(){


		}

    public function TotalPurchases() {
      $data["title"] 		  = "Total Purchases";
			$data["page_name"]  = "Total Purchases";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('totalpurchases',$data);
    }

    public function TotalUsed() {
      $data["title"] 		  = "Total Used / Stock Out";
			$data["page_name"]  = "Total Used / Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('totalused',$data);
    }

    public function EndingInventory() {
      $data["title"] 		  = "Total Used / Stock Out";
			$data["page_name"]  = "Total Used / Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('totalused',$data);
    }
    public function StockForTransfer() {
      $data["title"] 		  = "Total Used / Stock Out";
			$data["page_name"]  = "Total Used / Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('totalused',$data);
    }
    public function PendingDeliveries() {
      $data["title"] 		  = "Total Used / Stock Out";
			$data["page_name"]  = "Total Used / Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('totalused',$data);
    }
    public function Discrepancies() {
      $data["title"] 		  = "Total Used / Stock Out";
			$data["page_name"]  = "Total Used / Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('totalused',$data);
    }

}
