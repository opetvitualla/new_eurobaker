<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ManageStocks extends MY_Controller {
			public function __construct() {
					parent::__construct();
			}

	public function index(){


	}

    public function StockTransfer() {
      $data["title"] 		  = "Stock Transfer";
			$data["page_name"]  = "Stock Transfer";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('stocktransfer',$data);
    }

    public function stock_out() {
      $data["title"] 		  	= "Stock Out";
			$data["page_name"]  = "Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('stockout',$data);
    }

    public function StockAdjustments() {
      $data["title"] 		  = "Stock Adjustment";
			$data["page_name"]  = "Stock Adjustment";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";

			$this->load_page('stockadjustments',$data);
    }

}
