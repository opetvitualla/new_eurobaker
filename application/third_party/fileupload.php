
<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class fileupload {

        protected $CI;
        protected $show_error = false;
        // default path
        protected $path = "./assets/uploads/";
        // default file extension
        protected $allowed_types = 'gif|jpg|png|pdf|docx|doc|zip'; 
        // default size
        protected $max_size = 99999999;

        protected $upload_error = "";

        protected $success_data = "";

        public function __construct($params = array())
        {
              $this->CI =& get_instance();
              if(!empty($params)){
                $this->init($params);
              }
        }

        public function init($params = array())
        {
            if($params){
               if(!empty($params["path"])){
                   $this->path = $params["path"];
               }
               if(!empty($params["show_error"])){
                   $this->show_error = $params["show_error"];
               }
               if(!empty($params["max_size"])){
                   $this->max_size = $params["max_size"];
               }
               if(!empty($params["allowed_types"])){
                   $this->allowed_types = $params["allowed_types"];
               }
            }
        }

        public function doUpload()
        {
            $config['upload_path']          = $this->path;
            $config['allowed_types']        = $this->allowed_types;
            $config['max_size']             = $this->max_size;

            $this->CI->load->library('upload', $config);

            $filename = "file";
            if(empty($_FILES["file"])){
                foreach ($_FILES as $file => $value) {
                   $filename = $file;
                }
            }

            if ( ! $this->CI->upload->do_upload($filename)){
                    $err = $this->CI->upload->display_errors();
                    $this->set_error($err);
                    return false;
            }
            else{
                $res = $this->CI->upload->data();
                 $this->set_data($res);
                return true;
            }
        }
        public function get_error(){
            return $this->upload_error;
        }

        private function set_error($err){
            $this->upload_error= $err;
        }

        public function get_data(){
            return  $this->success_data;
        }
        private function set_data($data){
            $this->success_data = $data;
        }
         public function is_file_exists(){ 
            $myfile = "./assets/registration_files/".$_FILES["file"]["name"];
            if(file_exists($myfile)){
                return true;
            }
            return false;
        }

}