<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Other_outlet_deliveries extends MY_Controller {
		public function __construct() {
				parent::__construct();
		}

		public function index(){
			$data["title"] 		  	= "Other Outlet Deliveries";
			$data["page_name"]  = "Other Outlet Deliveries";
			$data['has_header'] = "includes/admin/header";
			$data['has_modal'] = "modal/modal";
			$data['has_footer']	= "includes/index_footer";

			if (get_user_type() == 1) {
				$this->load_page('index',$data);
			} 

		}

		public function get_other_deliveries_data(){
			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');
			
			$column_order = array(
				'PK_purchase_order_id',
				'purchase_order_no',
				'outlet.outlet_name',
				'sup.supplier_name',
				'po.total_amount',
				'po.status',
				'other.checked_by',
				'other.fk_outlet_to_id',
				'other.fk_outlet_recieved_id',
				'po.date_added',
			);
			$join         = array(
				"eb_other_outlet_delivery other" => "other.fk_po_id = po.PK_purchase_order_id",
				"eb_suppliers sup" => "sup.PK_supplier_id = po.FK_supplier_id",
				"eb_outlets outlet" => "outlet.PK_branch_id = po.FK_branch_id",
			);
			$select       = "*";
			$where        = array(
				'po.status !=' => "deleted",
				"po.fk_received_outlet_id" => _get_branch_assigned()
				
			);
			$group        = array();
			$list         = $this->MY_Model->get_datatables('eb_purchase_order po',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

			if(!empty($list["data"])){
				$idx = 0;
				foreach ($list["data"] as $key) {
					
					$par['select'] = 'outlet_name';
					$par['where']  = array('PK_branch_id' => $key->fk_outlet_recieved_id);
					
					$getdata       = getData('eb_outlets', $par, 'obj');

					if(!empty($getdata)){
						$list["data"][$idx]->recieve_outlet = $getdata[0]->outlet_name;
					}

					$par['select'] = 'outlet_name';
					$par['where']  = array('PK_branch_id' => $key->fk_outlet_to_id);
					
					$getdata       = getData('eb_outlets', $par, 'obj');

					if(!empty($getdata)){
						$list["data"][$idx]->reciever_outlet = $getdata[0]->outlet_name;
					}

					$idx += 1;
				}

			}
			
			$list_purchase_order = array(
				"draw" => $draw,
				"recordsTotal" => $list['count_all'],
				"recordsFiltered" => $list['count'],
				"data" => $list['data']
			);
			echo json_encode($list_purchase_order);
		}
		


	public function get_po_details($po_id){

		$response = array("result" => "error");
		
		if(!empty($po_id)){

			$par["select"] 	= "*";
			$par["where"]	= "po.PK_purchase_order_id = {$po_id}";
			$par["join"] 	= array(
				"eb_suppliers supplier" => "supplier.PK_supplier_id = po.FK_supplier_id",
				"eb_outlets outlet" => "outlet.PK_branch_id = po.FK_branch_id",
				
			);

			$po_data = getData("eb_purchase_order po", $par, "obj");
			
			if(!empty($po_data)){
			
				$par["select"] 	= "*";
				$par["where"]	= "po_item.FK_purchase_id = {$po_id}";
				$par["join"] 	= array(
					"eb_raw_materials_list raw_mat" => "raw_mat.PK_raw_materials_id = po_item.FK_raw_material_id",
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
		
		$response = ["status" => "error"];

		$post = $this->input->post();

		if(!empty($post)){

			$po_id = $post["po_id"];

			if(!empty($post["disc_item"])){
				$disc_items = json_decode($post["disc_item"]);
			}
			if(!empty($post["all_items"])){
				$all_items = json_decode($post["all_items"]);
			}

			$data = array(
				"FK_purchase_id" => $po_id,
				"FK_received_user_id" => my_user_id(),
				"status" => 1,
				"counter_checked" => $post["counter_check"],
				"date_received" => date("Y-m-d h:i:s")
			);

			insertData("eb_purchase_order_received", $data);

			$data = array(
				'fk_po_id' => $po_id,
				'fk_receiver_id' => my_user_id(),
				'checked_by' => $post["counter_check"],
				'fk_outlet_recieved_id' => _get_branch_assigned(),
				'fk_outlet_to_id' => $post["outlet_id"],
				'date_received' => date("Y-m-d"),
			);
			
			$id = insertData('eb_other_outlet_delivery', $data);

			$set = array( "status" => "received",  "purchase_order_no" => "N/A", "fk_received_outlet_id" => _get_branch_assigned());
			$where = array( "PK_purchase_order_id" => $po_id );

			updateData("eb_purchase_order", $set, $where);

			if(!empty($disc_items)){
				$data = array(
					"fk_purchase_id" => $po_id,
					"status" => 1,
					"reason" => $post["reason"],
					"date_added" => date("Y-m-d")
				);

				$disc_id = insertData("eb_other_outlet_discrepancy", $data);

				foreach ($disc_items as $item) {
					$data = array(
						"fk_po_discrepancy_id" => $disc_id,
						"fk_material_id" => $item->item_id,
						"material_name" => $item->item_name,
						"qty" => $item->quantity,
						"received_qty" => $item->rec_qty,
						"unit" => $item->unit,
						"date_added" => date("Y-m-d")
					);

					insertData("eb_other_discrepancy_items", $data);
				}

			}

			$response = ["status" => "success"];

		}

		echo json_encode($response);

	}
}
