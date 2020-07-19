
    <div id="main-wrapper">
        <div class="page-wrapper">
            <!-- ============================================================== -->
            <!-- Container fluid  -->
            <!-- ============================================================== -->
            <div class="container-fluid">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="row page-titles">
                    <div class="col-md-5 align-self-center">
                        <h3 class="text-themecolor"><?= $title ?></h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active"><?= $title ?></li>
                        </ol>
                    </div>
                    <div class="col-md-7 align-self-center text-right d-none d-md-block">
                      
                    </div>
                    <div class="">
                        <button class="right-side-toggle waves-effect waves-light btn-inverse btn btn-circle btn-sm pull-right m-l-10"><i class="ti-settings text-white"></i></button>
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-md-2">
                        <label for="">Date From:</label>
                        <div class="fbold"><?= date("F 01, Y")?></div>
                    </div>
                    <div class="col-md-2">
                        <label for="">Date To:</label>
                        <div class="fbold"><?= date('F t, Y')?></div>
                    </div>
                    <div class="col-md-8 text-right">
                        <button class="btn btn-success">Record Monthly Inventory</button>
                    </div>
                    <div class="col-12">
                        <div class="card mt-3">
                                <div class="table-responsive m-t-40">
                                    <!-- <table id="total_purchase_table" class="table table-bordered table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th>Stock Out ID</th>
                                                <th>Segment Name</th>
                                                <th>Total Items</th>
                                                <th>Total Amount</th>
                                                <th>Requested By</th>
                                                <th>Status</th>
                                                <th>Date Added</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        </tbody>
                                    </table> -->
                                </div>
                        </div>
                    </div>
                </div>

                <?php
                    if(isset($has_modal)){
                        $this->load->view($has_modal);
                    }
                ?>

                <!-- ============================================================== -->
                <!-- End PAge Content -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Right sidebar -->
                <!-- ============================================================== -->
                <!-- .right-sidebar -->

                <!-- ============================================================== -->
                <!-- End Right sidebar -->
                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Container fluid  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- footer -->
            <!-- ============================================================== -->
            <footer class="footer">
                Euro Baker Inventory System
            </footer>
            <!-- ============================================================== -->
            <!-- End footer -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Page wrapper  -->
        <!-- ============================================================== -->
    </div>
    <!-- ============================================================== -->
    <!-- End Wrapper -->
    <!-- ============================================================== -->
    <!-- ============================================================== -->
    <!-- All Jquery -->
    <!-- ============================================================== -->
