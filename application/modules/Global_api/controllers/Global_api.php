<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Global_api extends MY_Controller {
		public function __construct() {
				parent::__construct();
				
		}

		public function index(){
			
		}

		public function get_suppliers(){
			$response = array(
				"data" => _get_suppliers()
			);
			echo json_encode($response);
		}

		public function get_items(){
			$response = array(
				"data" => _get_items()
			);
			echo json_encode($response);
		}

		public function get_units(){
			$response = array(
				"data" => _get_all_units()
			);
			echo json_encode($response);
		}

		public function get_item_units($item_id = 0){
			$response = array(
				"data" => _get_item_units($item_id)
			);
			echo json_encode($response);
		}

		
		public function get_all_purchase_order_processing(){

			$response = array( "result" => false, );

			$par['select'] = '*';
			$par['where']  = array(
				'status' => 'processing',
				"FK_branch_id !=" => _get_branch_assigned(),
			);
			
			$getdata       = getData('eb_purchase_order po', $par, 'obj');

			$result = [];

			$c =0;
			foreach ($getdata as $key) {
				
				$po_id = $key->PK_purchase_order_id;

				if($this->is_exist_others($po_id)){
					unset($getdata[$c]);
				}

				$c++;
			}

			$result = array_values($getdata);

			$response = array( "result" => true, "data" => $result );

			echo json_encode($response);

		}


		private function is_exist_others($po_id){
			$par['select'] = '*';
			$par['where']  = array('fk_po_id' => $po_id);
			
			$getdata       = getData('eb_other_outlet_delivery', $par, 'obj');

			return !empty($getdata);

		}
}
