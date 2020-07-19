<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Stockout extends MY_Controller {
		public function __construct() {
				parent::__construct();
		}

		public function index(){
			$data["title"] 		  	= "Stock Out";
			$data["page_name"]  = "Stock Out";
			$data['has_header'] = "includes/admin/header";
			$data['has_modal'] = "modal/modal";
			$data['has_footer']	= "includes/index_footer";

			$data["supervisors"] = $this->get_branch_supervisors();

			$par["select"] = "*";
			$par["where"] = array(
				"FK_branch_id" => _get_branch_assigned(),
				"status" => 1,
			);

			$segment = getData("eb_segment", $par, "obj");

			$data["segments"] = $segment;

			if (get_user_type() == 1) {
				$this->load_page('index',$data);
			}
			else if (get_user_type() == 2) {
				redirect(base_url());
			}
			else{
				$this->load_super_page('index_supervisor',$data);
			}
		}

		public function get_stockout_data(){
			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');

			$column_order = array(
				'so.PK_stock_out_id',
				'seg.segment_name',
				'so.total_items',
				'so.total_amount',
				'user.firstname',
				'so.status',
				'so.date_added',
			);

			$join         = array(
				"eb_segment seg" => "so.FK_segment_id = seg.PK_segment_id",
				"eb_users_meta user" => "user.FK_user_id = so.FK_user_id",
			);
			$select       = "so.PK_stock_out_id, seg.segment_name, so.total_items, so.total_amount, user.firstname, so.status, so.date_added";
			$where        = array(
				"so.FK_outlet_id " => _get_branch_assigned()
			);
			$group        = array();
			$list         = getDataTables('eb_stock_out so',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

			$list_purchase_order = array(
				"draw" => $draw,
				"recordsTotal" => $list['count_all'],
				"recordsFiltered" => $list['count'],
				"data" => $list['data']
			);

			echo json_encode($list_purchase_order);
		}


	public function save_stock_out(){

		$post = $this->input->post();

		if(!empty($post)){

			$data = array(
				"FK_user_id" 	 	=> my_user_id(), // change if naa nay useer
				"FK_outlet_id"  	=>  _get_branch_assigned(),
				"FK_segment_id" 	=> $post["segment_id"],
				"total_items"	  	=> $post["total_items"],
				"total_amount"	  	=> $post["over_total"],
				"fk_requested_id"	=> $post["requested_by"],
				"status"		  	=> "pending",
				"date_added"	  	=> date("Y-m-d h:i:s")
			);


			$so_id = insertData("eb_stock_out", $data); // insert po

			$items = json_decode($post["so_items"]);

			foreach ($items as $item) {
				$data = array(
					"FK_stock_out_id" 		=> $so_id,
					"FK_raw_material_id" 	=> $item->item_id,
					"quantity" 				=> $item->quantity,
					"amount" 				=> $item->price,
					"item_unit" 			=>  $item->unit,
					"date_added"			=> date("Y-m-d h:i:s")
				);

				insertData("eb_stock_out_items", $data);
			}

			$response = array( "result" => "success" );

			echo json_encode($response);

		}
	}

	public function update_stock_out(){
		$post = $this->input->post();

		if(!empty($post)){

			$so_id = $post["so_id"];
			$where = array( "PK_stock_out_id" => $so_id );

			$set = array(
				"FK_user_id" 	 	=> my_user_id(), // change if naa nay useer
				"FK_outlet_id"  	=>  _get_branch_assigned(),
				"FK_segment_id" 	=> $post["segment_id"],
				"total_items"	  	=> $post["total_items"],
				"total_amount"	  	=> $post["over_total"],
			);

			updateData("eb_stock_out", $set, $where); // update po

			$where = array( "FK_stock_out_id" => $so_id );
			deleteData("eb_stock_out_items", $where);

			$items = json_decode($post["so_items"]);

			foreach ($items as $item) {
				$data = array(
					"FK_stock_out_id" 		=> $so_id,
					"FK_raw_material_id" 	=> $item->item_id,
					"quantity" 				=> $item->quantity,
					"amount" 				=> $item->price,
					"item_unit" 			=>  $item->unit,
					"date_added"			=> date("Y-m-d h:i:s")
				);
				insertData("eb_stock_out_items", $data);
			}

			$response = array( "result" => "success" );

			echo json_encode($response);
		}

	}

	public function get_so_details($so_id){

		$response = array("result" => "error");

		if(!empty($so_id)){

			$par["select"] 	= "*";
			$par["where"]	= "so.PK_stock_out_id = {$so_id}";
			$par["join"] 	= array(
				"eb_segment seg" => "so.FK_segment_id = seg.PK_segment_id",
				"eb_users_meta user_meta" => "user_meta.FK_user_id = so.FK_user_id",
			);
			
			$so_data = getData("eb_stock_out so", $par, "obj");

			if(!empty($so_data)){
			
				$par['select'] = 'firstname, lastname, counter_checked, date_approved';
				$par['where']  = array('fk_stockout_id' => $so_id);
				$par["join"] 	= array(
					"eb_users_meta user_meta" => "user_meta.FK_user_id = so_app.fk_approve_user_id",
				);
				$app_data       = getData('eb_stock_out_approved so_app', $par, 'obj');
				$so_data[0]->{"approved_data"} = $app_data;
				$so_data[0]->{"request_user"} = $this->get_request_user($so_id);

				$par["select"] 	= "*";
				$par["where"]	= "so_item.FK_stock_out_id = {$so_id}";
				$par["join"] 	= array(
					"eb_raw_materials_list raw_mat" => "raw_mat.PK_raw_materials_id = so_item.FK_raw_material_id",
				);

				$so_items = getData("eb_stock_out_items so_item", $par, "obj");

				if(!empty($so_items)){
					$so_data[0]->{"so_items"} = $so_items;
				}
			}

			$response = array("result" => "success", "data" =>$so_data );
		}

		echo json_encode($response);
	}

	private function get_request_user ($so_id){
		
		$par['select'] = 'firstname, lastname';
		$par['where']  = array(
			'so.PK_stock_out_id' => $so_id,
			'so.status' => "approved",
			"so.FK_outlet_id" => _get_branch_assigned()
		);
		$par['join']   = array('eb_stock_out so' => 'so.fk_requested_id = meta.FK_user_id');
		
		$getdata       = getData('eb_users_meta meta', $par, 'obj');

		return $getdata;

	}

	public function approve_request_form(){
		$post 	  = $this->input->post();
		$response = array("result" => "error");

		$so_id = $post["so_id"];
		$counter_checked = $post["counter_check"];
		$disc_items = json_decode($post["disc_item"]);
		$all_items = json_decode($post["all_items"]);


		if(!empty($so_id)){

			$data = array(
				"fk_stockout_id" => $so_id,
				"fk_approve_user_id" => my_user_id(),
				"counter_checked" => $counter_checked,
				"status" => 1,
				"date_approved" => date("Y-m-d h:i:s")
			);

			insertData("eb_stock_out_approved", $data);

			$set = array( "status" => "approved", );
			$where = array( "PK_stock_out_id" => $so_id );

			updateData("eb_stock_out", $set, $where);

			if(!empty($disc_items)){
				$data = array(
					"fk_stock_out_id" => $so_id,
					"status" => 1,
					"reason" => $post["reason"],
					"date_added" => date("Y-m-d h:i:s")
				);

				$disc_id = insertData("eb_stock_out_discrepancy", $data);

				foreach ($disc_items as $item) {
					$data = array(
						"fk_so_discrepancy_id" => $so_id,
						"fk_material_id" => $item->item_id,
						"material_name" => $item->item_name,
						"qty" => $item->quantity,
						"unit" => $item->unit,
						"received_qty" => $item->rec_qty,
						"date_added" => date("Y-m-d h:i:s")
					);

					insertData("eb_so_discrepancy_items", $data);

				}

			}

			if(!empty($all_items)){
				$this->update_inventory($all_items, $so_id);
			}

			$response = array("result" => "success");
		}

		echo json_encode($response);
	}
	
	// update inventory

	private function update_inventory($items = array(), $trans_id= 0){

		if(!empty($items)){
			foreach ($items as $item) {

				// get qty
				$par['select'] = 'quantity';
				$par['where']  = array( 'FK_raw_material_id' => $item->item_id, 'FK_outlet_id' => _get_branch_assigned() );
				$qty_data= getData('eb_item_inventory', $par, 'obj');

				$qty =0;       
				if(!empty($qty_data)){
					$qty = $qty_data[0]->quantity;   
				}

				$set = array(
					'quantity' => $qty -  $item->rec_qty,
					'type' => "stockout",
					"date_updated" => date("Y-m-d")
				);

				$where = array(
					'FK_raw_material_id' => $item->item_id,
					'FK_outlet_id' => _get_branch_assigned(),
				);
				
				updateData('eb_item_inventory', $set, $where);

				$data = array(
					'fk_item_id' =>  $item->item_id,
					'type_entry' => "stockout",
					'trans_id' => $trans_id,
					'from_value' =>  $qty,
					'value' =>  $item->rec_qty,
					"branch_id" => _get_branch_assigned(),
					"date_added" => date("Y-m-d"),
					"cal_type"	 => "sub"
				);

				insertData('eb_inventory_movement', $data);
			}
		}

	} 

	private function get_branch_supervisors (){
		
		$res = [];

		$par['select'] = '*';
		$par['where']  = array(
			'user_type' => 3,
			'user_status' => 1,
			'branch_assigned' => _get_outlet_assigned(),
		);
		$par['join']   = array('eb_users_meta meta' => 'meta.FK_user_id  = user.PK_user_id');
		
		$getdata       = getData('eb_users user', $par, 'obj');

		return $getdata;

	}

}
