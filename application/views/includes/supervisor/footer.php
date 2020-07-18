  <input type="hidden" class="base_url" value="<?= base_url() ?>">

    <script src="<?= base_url("assets/module/jquery/jquery.min.js")?>"></script>
    <!-- Bootstrap tether Core JavaScript -->
    <script src="<?= base_url("assets/module/bootstrap/js/popper.min.js")?>"></script>
    <script src="<?= base_url("assets/module/bootstrap/js/bootstrap.min.js")?>"></script>

    <script src="<?= base_url("assets/module/bootstrap/js/bootstrap.min.js")?>"></script>
    <!-- slimscrollbar scrollbar JavaScript -->
    <script src="<?= base_url("assets/module/ps/perfect-scrollbar.jquery.min.js")?>"></script>
    <!--Wave Effects -->
    <script src="<?= base_url("assets/js/waves.js")?>"></script>

    <!--Menu sidebar -->
    <script src="<?= base_url("assets/js/sidebarmenu.js")?>"></script>
    <!--stickey kit -->
    <script src="<?= base_url("assets/module/sticky-kit-master/dist/sticky-kit.min.js")?>"></script>
    <script src="<?= base_url("assets/module/sparkline/jquery.sparkline.min.js")?>"></script>
    <script src="<?= base_url("assets/module/moment/moment.js")?>"></script>
    <!--Custom JavaScript -->
    <script src="<?= base_url("assets/js/custom.min.js")?>"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script> -->
 <script src="<?= base_url("assets/js/select2.js")?>"></script>
    <!-- datatalbe -->
    <script src="<?= base_url("assets/module/datatables.net/js/jquery.dataTables.min.js")?>"></script>
    <script src="<?= base_url("assets/module/datatables.net-bs4/js/dataTables.responsive.min.js")?>"></script>
    <!-- ============================================================== -->
    <!-- Style switcher -->
    <!-- ============================================================== -->
    <script src="<?= base_url("assets/module/styleswitcher/jQuery.style.switcher.js")?>"></script>
     <script src="<?= base_url("assets/js/axios.js")?>"></script>
     <script src="<?= base_url("assets/js/print.js")?>"></script>
     <script src="<?= base_url("assets/js/sweetalert.js")?>"></script>

     <?php $this->load->view("modules/swal_vue_function") ?>
    <?php
        // // Initialize User customize class
        // echo (_user_script($this->current_class))?"\t<script type='text/javascript' src='".base_url('assets/js/'._user_script($this->current_class))."'></script>\n":'';
        
    ?>

    <script src="<?= base_url("assets/js/users_script/stockoutsupervisor.js")?>"></script>
    <script src="<?= base_url("assets/js/users_script/manageprofile.js")?>"></script>

</body>

</html>
