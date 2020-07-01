<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class ManageRawMaterials extends MY_Controller {
			public function __construct() {
					parent::__construct();
			}

		public function index(){
			$data["title"] 		  = "Raw Materials";
			$data["page_name"]  = "Raw Materials";
			$data['has_header'] = "includes/admin/header";
			$data['has_footer']	= "includes/index_footer";
      $data['categories'] = $this->MY_Model->getRows('EB_raw_materials_cat', $options = array(), 'row_array');

			$this->load_page('index',$data);

		}

    public function getRawMaterials() {
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
                        'average_cost',
                        'sales_price',
                      );
      $join         = array(
                        "EB_raw_materials_cat" => "EB_raw_materials_cat.PK_category_id = EB_raw_materials.FK_category_id"
                      );
      $select       = "PK_raw_materials_id, FK_outlet_id, FK_category_id, category_name, material_name, unit, average_cost, sales_price";
      $where        = array(
                        'EB_raw_materials.status' => 1,
                        'EB_raw_materials.FK_outlet_id' => _get_branch_assigned()
                      );

      

      $group        = array();
      $list         = $this->MY_Model->get_datatables('EB_raw_materials',$column_order, $select, $where, $join, $limit, $offset ,$search, $order, $group);

      $list_of_raw_materials = array(
                                  "draw" => $draw,
                                  "recordsTotal" => $list['count_all'],
                                  "recordsFiltered" => $list['count'],
                                  "data" => $list['data']
                                );
      echo json_encode($list_of_raw_materials);
    }

    public function addRawMaterial() {
      $post         = $this->input->post();
      $data         = array(
                        'FK_outlet_id'        => 1,
                        'material_name'       => $post['material_name'],
                        'FK_category_id'      => $post['category'],
                        'unit'                => $post['unit'],
                        'average_cost'        => $post['average_cost'],
                        'sales_price'         => $post['sales_price'],
                        'asset_value'         => '',
                        'total_asset_percent' => '',
                        'retail_value'        => '',
                        'total_retail_percent'=> '',
                        'status'              => 1
                      );
      $insert_data  = $this->MY_Model->insert('EB_raw_materials',$data);

      if ($insert_data) {
        $response = array(
                      'result' => 'success',
                    );
      } else {
        $response = array(
                      'result' => 'error',
                    );
      }
      echo json_encode($response);
    }

    public function viewDetails() {
      $data_id          = $this->input->post('id');
      $options['where'] = array(
                            'PK_raw_materials_id' => $data_id
                          );
      $options['join'] = array(
                            "EB_raw_materials_cat" => "EB_raw_materials_cat.PK_category_id = EB_raw_materials.FK_category_id"
                          );
      $data             = $this->MY_Model->getRows('EB_raw_materials', $options, 'row');
      echo json_encode($data);
    }

    public function updateDetails() {
      $data         = $this->input->post();
      $set          = array(
                        'material_name' => $data['material_name'],
                        'FK_category_id'=> $data['category'],
                        'unit'          => $data['unit'],
                        'average_cost'  => $data['average_cost'],
                        'sales_price'   => $data['sales_price'],
                      );
      $where        = array(
                        'PK_raw_materials_id' => $data['id']
                      );
      $update_data  = $this->MY_Model->update('EB_raw_materials',$set,$where);

      if ($update_data) {
        $response = array(
                      'result' => 'success',
                    );
      } else {
        $response = array(
                      'result' => 'error',
                    );
      }
      echo json_encode($response);
    }

}
