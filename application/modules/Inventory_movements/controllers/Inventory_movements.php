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

		}

		 public function get_raw_materials() {
			$limit        = $this->input->post('length');
			$offset       = $this->input->post('start');
			$search       = $this->input->post('search');
			$order        = $this->input->post('order');
			$draw         = $this->input->post('draw');
			$column_order = array(
				'PK_raw_materials_id',
				'category_name',
				'material_name',
				'unit',
				'sales_price',
			);
			$join         = array(
				"eb_raw_materials_cat" => "eb_raw_materials_cat.PK_category_id = eb_raw_materials_list.FK_category_id"
			);
			$select       = "PK_raw_materials_id, FK_outlet_id, FK_category_id, category_name, material_name, unit, sales_price";
			$where        = array(
				'eb_raw_materials_list.status' => 1,
				'eb_raw_materials_list.FK_outlet_id' => _get_branch_assigned()
			);

			$group        = array();
			$list         = $this->MY_Model->get_datatables('eb_raw_materials_list',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

			if(!empty($list)){

				$c =0;
				foreach ($list["data"] as $key) {
					
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


	private function get_movements($id){

		$branch_id = _get_branch_assigned();

		$datefrom  = date("Y-m")."1";
		$dateto  = date("Y-m-d");

		$par['select'] = '*';
		$par['where']  = array(
			'branch_id' => $branch_id,
			'date_added >=' => $datefrom,
			'date_added <=' => $dateto,
		);
		
		$getdata       = getData('eb_inventory_movement', $par, 'obj');



		if(!empty($getdata)){


		}

	}

}
