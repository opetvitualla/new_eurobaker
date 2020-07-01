<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class emaillibrary {

        protected $CI;
        protected $from_email  = "noreply@cbmcgroup.com.ph";
        protected $to_email ="prospteam@gmail.com";
        protected $smtp_host ="secure.emailsrvr.com";
        protected $protocol ="smtp";
        // protected $smtp_user = "form_online050@proweaver.net";
        // protected $smtp_pass = "pqR0_skC1itYsl#20";
         protected $smtp_user = "form_online060@proweaver.net";
         protected $smtp_pass = "cWuMwf_L1yfTOe20#";
        
        protected $smtp_port =587;
        protected $message ="sample message";
        protected $mail_type ="html";
        protected $subject ="CBMC";
        protected $error ="";

        // $config = array(
        //     'protocol' => 'smtp', // 'mail', 'sendmail', or 'smtp'
        //     'smtp_host' => 'smtp.example.com',
        //     'smtp_port' => 465,
        //     'smtp_user' => 'no-reply@example.com
        // 	',
        //     'smtp_pass' => '12345!',
        //     'smtp_crypto' => 'ssl', //can be 'ssl' or 'tls' for example
        //     'mailtype' => 'text', //plaintext 'text' mails or 'html'
        //     'smtp_timeout' => '4', //in seconds
        //     'charset' => 'iso-8859-1',
        //     'wordwrap' => TRUE
        // );

        public function __construct($params = array())
        {
              $this->CI =& get_instance();
              if(!empty($params)){
                $this->initialize($params);
              }
        }

        public function initialize($params){
              if(!empty($params["from_email"])){
                      $this->from_email = $params["from_email"];
                  }
                  if(!empty($params["to_email"])){
                      $this->to_email = $params["to_email"];
                  }
                  if(!empty($params["smtp_host"])){
                      $this->smtp_host = $params["smtp_host"];
                  }
                  if(!empty($params["protocol"])){
                      $this->protocol = $params["protocol"];
                  }
                  if(!empty($params["smtp_user"])){
                      $this->smtp_user = $params["smtp_user"];
                  }
                  if(!empty($params["smtp_pass"])){
                      $this->smtp_pass = $params["smtp_pass"];
                  }
                  if(!empty($params["smtp_port"])){
                      $this->smtp_port = $params["smtp_port"];
                  }
                  if(!empty($params["message"])){
                      $this->message = $params["message"];
                  }if(!empty($params["mail_type"])){
                      $this->mail_type = $params["mail_type"];
                  }
                  if(!empty($params["subject"])){
                      $this->subject = $params["subject"];
                  }
        }

        public function sendmail($data= array()){

                $config = array(
                    "smtp_host"=> $this->smtp_host,
                    "protocol"=> $this->protocol,
                    "smtp_user"=> $this->smtp_user,
                    "smtp_pass"=> $this->smtp_pass,
                    "smtp_port"=> $this->smtp_port,
                );
                $this->CI->load->library('email');
                $this->CI->email->initialize($config);
                $this->CI->email->set_newline("\r\n");
                if (empty($data['from_email'])) {
                  $this->CI->email->from("noreply@cbmcgroup.com.ph");
                }else{
                  $this->CI->email->from($data['from_email']);
                }
                // $this->CI->email->from("noreply@cbmcgroup.com.ph", $data["title"]);
                $this->CI->email->to($this->to_email);
                $this->CI->email->subject($this->subject);

                if($this->mail_type =="html"){
                    $this->CI->email->set_mailtype("html");
                    $msg =  $this->CI->load->view("modules/mail_template", $data, true);
                }else{
                    $msg = $this->$data["msg"];
                }
                $this->CI->email->message($msg);

                if($this->CI->email->send()){
                    return true;
                }
                else{
               
                   return false;
                }
        }
}
