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
		$data["movements"] = $this->get_movements();

		if (get_user_type() == 1) {
			$this->load_page('index',$data);
		} 
		else if (get_user_type() == 2) {
			redirect(base_url());
		}

	}

	private function get_movements(){

		$par['select'] = '*';
		$par["where"]        = array(
			'mat.status' => 1,
			'mat.FK_outlet_id' => _get_branch_assigned()
		);
		$par["join"]         = array(
			"eb_raw_materials_cat cat" => "cat.PK_category_id = mat.FK_category_id",
			"eb_item_inventory env" => "env.FK_raw_material_id = mat.PK_raw_materials_id",
		);
		
		$items       = getData('eb_raw_materials_list mat', $par, 'obj');

		$c=0;

		foreach ($items as $item) {
			$item_id = $item->PK_raw_materials_id;

			$resp = [
				"tot_po"  => $this->get_trans_movements($item_id, "purchase"),
				"tot_tr_in"  => $this->get_trans_movements($item_id, "transfer_in"),
				"tot_tr_out"  => $this->get_trans_movements($item_id, "transfer_out"),
				"tot_so"  => $this->get_trans_movements($item_id, "stockout"),
				"beg_env" => $this->get_beg_inventory($item_id)
			];

			$items[$c]->inv_data = $resp;
			$c++;
		}
		
		return $items;
	}


	private function get_trans_movements ($item_id, $trans_type){

		$branch_id = _get_branch_assigned();
		$datefrom  = date("Y-m-1");
		$dateto  = date("Y-m-t");

		$par['where']  = array(
			'branch_id' => $branch_id,
			'date_added >=' => $datefrom,
			'date_added <=' => $dateto,
			"fk_item_id" => $item_id,
			"type_entry" => $trans_type,
		);

		if($trans_type == "transfer_in"){
			$par['where']  = array(
				'branch_id' => $branch_id,
				'date_added >=' => $datefrom,
				'date_added <=' => $dateto,
				"fk_item_id" => $item_id,
				"type_entry" => "transfer",
				"cal_type" => "add",
			);
		} else if(($trans_type == "transfer_out")) {
			$par['where']  = array(
				'branch_id' => $branch_id,
				'date_added >=' => $datefrom,
				'date_added <=' => $dateto,
				"fk_item_id" => $item_id,
				"type_entry" => "transfer",
				"cal_type" => "sub",
			);
		}
		$par['select'] = 'SUM(value) as tot';	
		$po_data       = getData('eb_inventory_movement', $par, 'obj');

		return (isset($po_data[0]->tot) ? $po_data[0]->tot : 0);

	}

	private function get_beg_inventory ($item_id){
		
		$cur_date = date("m");
		$res = 0;

		$par['select'] = '*';
		$par['where']  = array(
			'fk_item_id' => $item_id,
			'MONTH(date_added)' => $cur_date,
			'branch_id' => _get_branch_assigned(),
		);
		$par['order'] = 'pk_inv_move_id ASC, date_added ASC';
		$par['limit2'][0] = 1;
		
		$getdata       = getData('eb_inventory_movement', $par, 'obj');

		if(!empty($getdata)){
			$res = $getdata[0]->value;
		}
		
		return $res;
	}

	public function record_view(){
	

	}

}
