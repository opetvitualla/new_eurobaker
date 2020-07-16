<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Manageiteminventory extends MY_Controller {

	public function __construct() {
			parent::__construct();
	}

	public function index(){
		$data["title"] 		  = "Item Inventory";
		$data["page_name"]  = "Item Inventory";
		$data['has_header'] = "includes/admin/header";
		$data['has_footer']	= "includes/index_footer";

		if (get_user_type() == 1) {
			$this->load_page('index',$data);
		} else {
			$this->load_purchaser_page('purchaserView',$data);
		}

	}

	public function get_item_inventory() {
		$limit        = $this->input->post('length');
		$offset       = $this->input->post('start');
		$search       = $this->input->post('search');
		$order        = $this->input->post('order');
		$draw         = $this->input->post('draw');
		$column_order = array(
			'cat.category_name',
			'mat.material_name',
			'mat.sales_price',
			'inv.beginning_inventory',
			'inv.quantity',
			'inv.status',
			'inv.date_updated',
		);
		$join         = array(
				"eb_raw_materials_list mat" => "mat.PK_raw_materials_id = inv.FK_raw_material_id",
				"eb_raw_materials_cat cat" => "cat.PK_category_id = mat.FK_category_id",
		);
		$select       = "cat.category_name, mat.material_name, mat.sales_price, inv.beginning_inventory, inv.quantity, inv.status, inv.date_updated, PK_inventory_id, min_stock, inv.FK_raw_material_id";
		$where        = array(
			"inv.FK_outlet_id" => _get_branch_assigned(),
			"mat.status" => 1,
		);
		$group        = array();
		$list         = $this->MY_Model->get_datatables('eb_item_inventory inv',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

		if(!empty($list)){

			$c =0;
			foreach ($list["data"] as $key) {
				$list["data"][$c]->beg_inv = $this->get_beg_inventory($key->FK_raw_material_id);
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

	public function view_details() {
		$data_id          = $this->input->post('id');
		$options['select'] = array(
			'PK_inventory_id',
			'material_name',
			'amount',
			'beginning_inventory',
			'quantity',
			'eb_item_inventory.status',
			'eb_item_inventory.date_added',
			'eb_item_inventory.date_updated',
		);
		$options['where'] = array(
			'PK_inventory_id' => $data_id
		);
		$options['join'] = array(
			"eb_raw_materials" => "eb_raw_materials.PK_raw_materials_id = eb_item_inventory.FK_raw_material_id"
		);
		$data             = $this->MY_Model->getRows('eb_item_inventory', $options, 'row');
		echo json_encode($data);
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
