<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Inventory_movements extends MY_Controller {
		public function __construct() {
				parent::__construct();
		}

		public function index(){
			$data["title"] 		  	= "Inventory movements";
			$data['has_header'] = "includes/admin/header";
			$data['has_modal'] = "modal/modal";
			$data['has_footer']	= "includes/index_footer";

			if (get_user_type() == 1) {
				$this->load_page('index',$data);
			}
			if (get_user_type() == 2) {
				$this->load_purchaser_page('index',$data);
			}
		}

		 public function get_raw_materials() {
			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');
			$column_order = array(
				'material_name',
				'beginning_inventory',
				'PK_raw_materials_id',
				'category_name',
				'sales_price',
				'env.quantity',
			);
			$join         = array(
				"eb_raw_materials_cat cat" => "cat.PK_category_id = mat.FK_category_id",
				"eb_item_inventory env" => "env.FK_raw_material_id = mat.PK_raw_materials_id",
				"eb_raw_materials_cat cat" => "cat.PK_category_id = mat.FK_category_id",
			);
			$select       = "*";
			$where        = array(
				'mat.status' => 1,
				'mat.FK_outlet_id' => _get_branch_assigned()
			);

			$group        = array();
			$list         = $this->MY_Model->get_datatables('eb_raw_materials_list mat',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);


			if(!empty($list)){

				$c =0;
				foreach ($list["data"] as $key) {
					$list["data"][$c]->inv_data = $this->get_movements($key->PK_raw_materials_id);
					$c++;
				}

			}

			$list_of_raw_materials = array(
				"draw" => $draw,
				"recordsTotal" => $list['count_all'],
				"recordsFiltered" => $list['count'],
				"data" => $list['data']
			);

			echo json_encode($list_of_raw_materials);
    }


	private function get_movements($item_id){

		$resp = [
			"tot_po"  => $this->get_trans_movements($item_id, "purchase"),
			"tot_tr"  => 0,
			"tot_so"  => $this->get_trans_movements($item_id, "stockout"),
			"beg_env" => $this->get_beg_inventory($item_id)
		];


		return $resp;
	}


	private function get_trans_movements ($item_id, $trans_type){

		$branch_id = _get_branch_assigned();

		$datefrom  = date("Y-m")."1";
		$dateto  = date("Y-m-d");

		$par['select'] = 'SUM(value) as tot';
		$par['where']  = array(
			'branch_id' => $branch_id,
			'date_added >=' => $datefrom,
			'date_added <=' => $dateto,
			"fk_item_id" => $item_id,
			"type_entry" => $trans_type,
		);
		
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

}
