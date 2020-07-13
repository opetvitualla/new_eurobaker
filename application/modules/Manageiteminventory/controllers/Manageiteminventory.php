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

		public function getItemInventory() {
			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');
			$column_order = array(
				'PK_inventory_id',
				'material_name',
				'amount',
				'beginning_inventory',
				'quantity',
				'eb_item_inventory.status',
				'eb_item_inventory.date_added',
			);
			$join         = array(
			                  "eb_raw_materials" => "eb_raw_materials.PK_raw_materials_id = eb_item_inventory.FK_raw_material_id"
			                );
			$select       = "PK_inventory_id, FK_raw_material_id, material_name, amount, beginning_inventory, quantity, eb_item_inventory.status, eb_item_inventory.date_added";
			$where        = array();
			$group        = array();
			$list         = $this->MY_Model->get_datatables('eb_item_inventory',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

      $list_of_raw_materials = array(
			"draw" => $draw,
			"recordsTotal" => $list['count_all'],
			"recordsFiltered" => $list['count'],
			"data" => $list['data']
		);
      echo json_encode($list_of_raw_materials);
		}

		public function viewDetails() {
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

}
