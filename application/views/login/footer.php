    <script src="<?= base_url("assets/module/jquery/jquery.min.js")?>"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <?php
        $msg = $this->session->flashdata("flash_data");
        if(isset($msg)){
            $this->load->view("modules/swal", $msg);
        }
    ?>

    <script>
        $(document).ready(function(){
            $(".preloader").hide();

            $("#frm_login").submit(function(){
                $(".preloader").show();
                 $("#frm_login").submit();
            })

            $("#form_forgot_password").submit(function(e){
                $(".preloader").show();
            })
        })
    </script>
    </body>
</html>