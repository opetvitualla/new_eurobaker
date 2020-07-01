<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ManagePurchaseOrders extends MY_Controller {
	public function __construct() {
		parent::__construct();

	}
	
	public function index(){

		$data["title"] 	 	= "Purchase Orders";
		$data["page_name"]  = "Purchase Orders";
		$data['has_header'] = "includes/admin/header";
		$data['has_footer']	= "includes/index_footer";
		$data["items"] 		= _get_items();
		$data["suppliers"]  = _get_suppliers();
		
		if (get_user_type() == 1) {
			$this->load_page('index',$data);
		} 
		else if (get_user_type() == 2) {
			$this->load_purchaser_page('purchaserView',$data);
		}
		else{
			redirect(base_url());
		}

	}
	
	public function getPurchaseOrder(){
		$limit        = $this->input->post('length');
		$offset       = $this->input->post('start');
		$search       = $this->input->post('search');
		$order        = $this->input->post('order');
		$draw         = $this->input->post('draw');
		
		$column_order = array(
			'PK_purchase_order_id',
			'outlet.outlet_name',
			'sup.supplier_name',
			'po.total_amount',
			'po.status',
			'po.date_added'
		);
		$join         = array(
			"eb_suppliers sup" => "sup.PK_supplier_id = po.FK_supplier_id",
			"eb_outlets outlet" => "outlet.PK_branch_id = po.FK_branch_id",
		);
		$select       = "PK_purchase_order_id, outlet.outlet_name, sup.supplier_name, po.status, po.date_added, po.total_amount";
		$where        = array(
			'po.status !=' => "deleted",
		);
		$group        = array();
		$list         = $this->MY_Model->get_datatables('eb_purchase_order po',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);
		
		$list_purchase_order = array(
			"draw" => $draw,
			"recordsTotal" => $list['count_all'],
			"recordsFiltered" => $list['count'],
			"data" => $list['data']
		);
		echo json_encode($list_purchase_order);
	}

	public function save_purchase_order(){

		$post = $this->input->post();

		if(!empty($post)){

			$data = array(
				"FK_supplier_id"  => $post["supplier_id"],
				"FK_user_id" 	  => 1, // change if naa nay user
				"FK_branch_id" 	  => 1,
				"status"		  => "pending",
				"total_amount"	  => $post["over_total"],
				"date_added"	  => date("Y-m-d h:i:s")
			);

			$po_id = insertData("eb_purchase_order", $data); // insert po

			$items = json_decode($post["po_items"]);

			foreach ($items as $item) {
				$data = array(
					"FK_purchase_id" 		=> $po_id,
					"FK_raw_material_id" 	=> $item->item_id,
					"quantity" 				=> $item->quantity,
					"status" 				=> 1,
					"item_unit" 			=>  $item->unit,
					"date_added"			=> date("Y-m-d h:i:s")
				);

				insertData("eb_purchase_order_item", $data);
			}

			$response = array( "result" => "success" );

			echo json_encode($response);

		}
	}

	public function received_purchase_order(){

	}

	public function update_purchase_order(){
		$post = $this->input->post();

		if(!empty($post)){

			$po_id = $post["po_id"];
			$where = array( "PK_purchase_order_id" => $po_id );

			$set = array(
				"FK_supplier_id"  => $post["supplier_id"],
				"FK_user_id" 	  => 1, // change if naa nay user
				"FK_branch_id" 	  => 1,
				"status"		  => "pending",
				"total_amount"	  => $post["over_total"],
				// "date_added"	  => date("Y-m-d h:i:s")
			);

			updateData("eb_purchase_order", $set, $where); // update po

			$where = array( "FK_purchase_id" => $po_id );
			deleteData("eb_purchase_order_item", $where); 

			$items = json_decode($post["po_items"]);

			foreach ($items as $item) {
				$data = array(
					"FK_purchase_id" 		=> $po_id,
					"FK_raw_material_id" 	=> $item->item_id,
					"quantity" 				=> $item->quantity,
					"status" 				=> 1,
					"date_added"			=> date("Y-m-d h:i:s")
				);

				insertData("eb_purchase_order_item", $data);
			}

			$response = array( "result" => "success" );
			echo json_encode($response);
		}
	}
	public function get_po_details($po_id){

		$response = array("result" => "error");
		
		if(!empty($po_id)){

			$par["select"] 	= "*";
			$par["where"]	= "po.PK_purchase_order_id = {$po_id}";
			$par["join"] 	= array(
				"eb_suppliers supplier" => "supplier.PK_supplier_id = po.FK_supplier_id",
			);

			$po_data = getData("eb_purchase_order po", $par, "obj");
			
			if(!empty($po_data)){
			
				$par["select"] 	= "*";
				$par["where"]	= "po_item.FK_purchase_id = {$po_id}";
				$par["join"] 	= array(
					"eb_raw_materials raw_mat" => "raw_mat.PK_raw_materials_id = po_item.FK_raw_material_id",
				);
				
				$po_items = getData("eb_purchase_order_item po_item", $par, "obj");

				if(!empty($po_items)){
					$po_data[0]->{"po_items"} = $po_items;
				}
			}

			$response = array("result" => "success", "data" =>$po_data );
		}

		echo json_encode($response);
	}

	public function get_received_po_details($po_id){
		
		$response = array("result" => "error");
		
		if(!empty($po_id)){

			$par["select"] 	= "*";
			$par["where"]	= "po.PK_purchase_order_id = {$po_id}";
			$par["join"] 	= array(
				"eb_suppliers supplier" => "supplier.PK_supplier_id = po.FK_supplier_id",
				"eb_purchase_order_received po_rec" => "po_rec.FK_purchase_id = po.PK_purchase_order_id",
			);

			$po_data = getData("eb_purchase_order po", $par, "obj");
			
			if(!empty($po_data)){
			
				$par["select"] 	= "*";
				$par["where"]	= "po_item.FK_purchase_id = {$po_id}";
				$par["join"] 	= array(
					"eb_raw_materials raw_mat" => "raw_mat.PK_raw_materials_id = po_item.FK_raw_material_id",
				);
				
				$po_items = getData("eb_purchase_order_item po_item", $par, "obj");

				if(!empty($po_items)){
					$po_data[0]->{"po_items"} = $po_items;
				}
			}

			$response = array("result" => "success", "data" =>$po_data );
		}

		echo json_encode($response);

	}

	public function receive_purchase_order(){

		$post 	  = $this->input->post();
		$response = array("result" => "error");

		$po_id = $post["po_id"];
		$disc_items = json_decode($post["disc_item"]);

		if(!empty($po_id)){
			
			$data = array(
				"FK_purchase_id" => $po_id,
				"FK_received_user_id" => get_user_id(),
				"status" => 1,
				"date_received" => date("Y-m-d h:i:s")
			);

			insertData("eb_purchase_order_received", $data);

			$set = array( "status" => "received", );
			$where = array( "PK_purchase_order_id" => "$po_id" );

			updateData("eb_purchase_order", $set, $where);

			if(!empty($disc_items)){
				$data = array(
					"fk_purchase_id" => $po_id,
					"status" => 1,
					"reason" => $post["reason"],
					"date_added" => date("Y-m-d h:i:s")
				);

				$disc_id = insertData("eb_purchase_order_discrepancy", $data);

				foreach ($disc_items as $item) {
					$data = array(
						"fk_po_discrepancy_id" => $po_id,
						"fk_material_id" => $item->item_id,
						"material_name" => $item->item_name,
						"qty" => $item->quantity,
						"received_qty" => $item->rec_qty,
						"date_added" => date("Y-m-d h:i:s")
					);

					insertData("eb_po_discrepancy_items", $data);

				}

			}


			$response = array("result" => "success");
		}

		echo json_encode($response);

	}

	public function process_purchase_order(){

		$post 	  = $this->input->post();
		$response = array("result" => "error");

		$po_id = $post["po_id"];

		if(!empty($po_id)){

			$set = array( "status" => "processing", );
			$where = array( "PK_purchase_order_id" => "$po_id" );

			updateData("eb_purchase_order", $set, $where);

			$response = array("result" => "success");
		}

		echo json_encode($response);

	}
	

}
