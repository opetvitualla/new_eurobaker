    <div id="print_div" style="display:none;">
        
    </div>
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
                            <li class="breadcrumb-item"><a href="<?= base_url("Stockout");?>"> Stock Out</a></li>
                            <li class="breadcrumb-item active"><?= $title ?></li>
                        </ol>
                    </div>
                    <div class="col-md-7 align-self-center text-right d-none d-md-block">
                    </div>
                    <div class="">
                       
                    </div>
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Start Page Content -->
                <!-- ============================================================== -->
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                                <div class="table-responsive m-t-40">
                                    <table id="table_disc" class="table table-bordered table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th>STOCK OUT ID</th>
                                                <th>Date of Process</th>
                                                <th>Received</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody> </tbody>
                                    </table>
                                </div>
                                
                        </div>
                    </div>
                </div>

            
                <!-- start -->
                <div class="modal fade discrepancy_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" style="max-width:900px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Discrepancy</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-body">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <label class="fbold" for="supplier">Supplier</label>
                                                <div class="div_value po_receive_supplier">sample text</div>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="fbold" for="supplier">Date Received</label>
                                                <div class="div_value po_received_date">sample text</div>
                                            </div>
                                            <div class="col-md-4">
                                                <label class="fbold" for="supplier">Received By</label>
                                                <div class="div_value po_received_by">John Doe</div>
                                            </div>
                                            <div class="col-md-12">
                                                <hr> </div>
                                        </div>
                                        <div class="cont-po">

                                            <table class="table table-bordered po-table">
                                                <thead>
                                                    <tr>
                                                        <td>Item Name</td>
                                                        <td>Quantity</td>
                                                        <td style="width: 122px;">Item Unit</td>
                                                        <td>Price</td>
                                                        <td>Total</td>
                                                    </tr>
                                                </thead>
                                                <tbody class="table-po-body-received"> </tbody>
                                            </table>
                                            <div class="form-actions">
                                                <hr/>
                                                <h3 class="fbold o-total">Total Purchased Item: <span class="total-item-received">0</span></h3>

                                                <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total-received">0</span></h3>
                                                <hr>
                                                <div class="card-body text-right ">
                                                    <button type="button" class="btn btn-success btn-generate-arf"> Discrepancy</button>                            
                                                    <button type="button" class="btn btn-success btn-generate-arf"> Generate ARF</button>
                                                    <button type="button" class="btn btn-danger"> Close</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>                                                                   
                <!-- end -->
                </div>
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
