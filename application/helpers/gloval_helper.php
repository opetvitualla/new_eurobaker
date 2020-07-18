<?php
defined('BASEPATH') OR exit('No direct script access allowed');

    if(!function_exists('_user_css')){
        function _user_css($user_css){
            if(file_exists('assets/css/users_css/'.$user_css.'.css')){
                return 'users_css/'.$user_css.'.css';
            }
            return null;
        }
    }

    if(!function_exists('_user_script')){
        function _user_script($user_js){
            if(file_exists('assets/js/users_script/'.$user_js.'.js')){
                return 'users_script/'.$user_js.'.js';
            }
            return null;
        }
    }

    function ajax_response($message, $type){
        $data = array(
            'message' => $message,
            'type' => $type
        );
        echo json_encode($data);
        exit;
    }

    function get_user_type() {

        $ci = & get_instance();

         return $ci->session->userdata("user_type");

    }

    function get_user_data($par = "user_id"){
        $ci = & get_instance();

        return $ci->session->userdata($par);
    }


    function _get_branch_assigned(){

        $ci = & get_instance();
        $data = json_decode($ci->session->userdata("branch_assigned"));

        return $data;

    }

    function _get_outlet_assigned(){

        $ci = & get_instance();
        $data = $ci->session->userdata("branch_assigned");

        return $data;

    }

    function _get_all_units(){

        $ci = & get_instance();
        $par["select"] = "*";
        $data = getData("eb_units", $par);
        return $data;
        
    }

    function _get_item_units($item_id = 0){

        $ci = & get_instance();
        $par["select"] = "*";
        $data = getData("eb_units", $par);
        return $data;

    }


    function _count_stock_transfer(){

        $ci = & get_instance();
        $outlet = $ci->session->userdata("branch_assigned");
        $par["select"] 	= "*";
        $par["where"]	= "FK_destination_branch_id = $outlet AND status=0";

        $data = getData("eb_stock_transfer", $par, "count");
        return $data;

    }

    function get_user_id(){
        $ci = & get_instance();
        if($ci->session->has_userdata("pk_user_id")){
            return $ci->session->userdata("pk_user_id");
        }

    }

    function my_user_id(){
        $ci = & get_instance();
        if($ci->session->has_userdata("PK_user_id")){
            return $ci->session->userdata("PK_user_id");
        }

    }

    function get_post(){
        $ci = & get_instance();
        return $ci->input->post();
    }

    function swal_data($msg, $err = "success"){
        $ci = & get_instance();
        $ci->session->set_flashdata("flash_data", array( "err"=>$err, "message" => $msg));
    }

    function get_logged_user($typ = "array"){
        $ci = & get_instance();
        if($typ== "array"){
            return $ci->session->userdata();
        }
        else if($typ== "obj"){
            return (object) $ci->session->userdata();
        }
        else if($typ== "json"){
            return json_encode($ci->session->userdata());
        }
        exit;
    }

    function getData($tbl ="", $par = array(), $r = "array"){
        $ci = & get_instance();
        $res=  $ci->MY_Model->getRows($tbl, $par, $r);
        return $res;
    }

    function insertData($tbl ="", $data = array()){
        $ci = & get_instance();
        $res=  $ci->MY_Model->insert($tbl, $data);
        return $res;
    }

    function getDataTables($table, $column_order, $select = "*", $where = "", $join = array(), $limit, $offset, $search, $order,$group = ''){
        $ci = & get_instance();
        $ci->db->from($table);
	  	if($select){
	  		$ci->db->select($select);
	  	}
	  	if($where){
	  		$ci->db->where($where);
	  	}
        if(!empty($join)){
            foreach($join as $key => $value){
                if(strpos($value,':') !== false){
                    $_join = explode(":",$value);
                    $ci->db->join($key,$_join[0],$_join[1]);
                } else {
                    $ci->db->join($key,$value);
                }
            }
        }
	  	if($search){
	  		$ci->db->group_start();
	  		foreach ($column_order as $item)
	  		{
	  			$ci->db->or_like($item, $search['value']);
	  		}
	  		$ci->db->group_end();
	  	}
	  	if($group)
	  		$ci->db->group_by($group);

	  	if($order)
	  		$ci->db->order_by($column_order[$order['0']['column']], $order['0']['dir']);
	    	$temp = clone $ci->db;
	    	$data['count'] = $temp->count_all_results();

	  	if($limit != -1)
	  		$ci->db->limit($limit, $offset);

	  	$query = $ci->db->get();
	  	$data['data'] = $query->result();

	  	$ci->db->from($table);
	  	$data['count_all'] = $ci->db->count_all_results();
	  	return $data;
	}


    function updateData($tbl ="", $set, $where = array()){
        $ci = & get_instance();
        $res=  $ci->MY_Model->update($tbl, $set, $where);
        return $res;
    }

    function deleteData($tbl ="", $where = array()){
        $ci = & get_instance();
        $res=  $ci->MY_Model->delete($tbl, $where);
        return $res;
    }

    function batchInsertData($tbl ="", $set = array()){
        $ci = & get_instance();
        $res=  $ci->MY_Model->batch_insert($tbl, $set);
        return $res;
    }



    function sendemail($to_email="", $message ="", $from_name="", $subject="", $type="", $from_email=""){
        $ci = & get_instance();
        if(empty($to_email)){
            $to_email = "prospteam@gmail.com";
        }
        if(empty($from_name)){
            $from_name = "CBMC";
        }
        if(empty($subject)){
            $subject = "Email Notification";
        }
        if(empty($message)){
            $message = "This is a message";
        }
        if(empty($type)){
            $type = "html";
        }

        $settings["mail_type"] = $type;
        $settings["to_email"] = $to_email;
        $settings["from_name"] = $from_name;
        $settings["from_email"] = $from_email;
        $settings["subject"] = $subject;

        $data["content"] = $message;
        $data["title"] = $from_name;
        $data["from_email"] = "prospteam@gmail.com";
        $ci->emaillibrary->initialize($settings);
        if($ci->emaillibrary->sendmail($data)){
            return true;
        }else{
            return false;
        }
        exit;

    }

    if(!function_exists('_get_suppliers')){
        function _get_suppliers($params = array()){

            $par["select"] = "PK_supplier_id, supplier_name";
            $par["where"]  = "status = 1";
            $supplier = getData("eb_suppliers", $par, "obj");

			return $supplier;
        }
    }

    if(!function_exists('_get_items')){
        function _get_items($params = array()){

            $par["select"] = "PK_raw_materials_id, FK_category_id, material_name, unit, sales_price, related_item_id";
            $par["where"]  = array(
                "FK_outlet_id" => _get_branch_assigned()
            );

            $items = getData("eb_raw_materials_list", $par, "obj");

            $c = 0;
            foreach ($items as $item) {
                
                $par['select'] = 'quantity';
                $par['where']  = array(
                    'FK_raw_material_id' => $item->PK_raw_materials_id,
                    'status' => 1,
                    "FK_outlet_id" => _get_branch_assigned()
                );
                
                $getdata       = getData('eb_item_inventory', $par, 'obj');
                $qty           = (!empty($getdata) ? $getdata[0]->quantity : 0);
                $items[$c]->inventory_quantity = $qty;

                $c++;

            }

			return $items;
        }
    }

?>
