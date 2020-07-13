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
                            <li class="breadcrumb-item active"><?= $title ?></li>
                        </ol>
                    </div>
                    <div class="col-md-7 align-self-center text-right d-none d-md-block">
                      <a href="<?= base_url("purchaseorderdiscrepancy")?>" type="button" class="btn btn-success ">Discrepancy</a>
                        <button type="button" class="btn btn-info theme-bg show-add-modal" data-toggle="modal"><i class="fa fa-plus-circle"></i> Add Purchase Order</button>
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
                                    <table id="purchase_Orders" class="table table-bordered table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th>P.O ID</th>
                                                <th>Outlet Name</th>
                                                <th>Supplier</th>
                                                <th>Status</th>
                                                <th>Total Amount</th>
                                                <th>Order Date</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                
                                        </tbody>
                                    </table>
                                </div>
                                
                        </div>
                    </div>
                </div>

                <div class="modal fade add_po_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" style="max-width:900px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Add Purchase Order</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="Purchase_Order_Add" action="#" method="POST">
                                    <div class="form-body">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label class="fbold" for="supplier">Select Supplier</label>
                                                    <select name="supplier" class="supplier_select form-control" style="width: 100%;">
                                                        <optgroup label="Select Supplier">
                                                            <?php
                                                                foreach ($suppliers as $sup) {
                                                                    echo "<option value='{$sup->PK_supplier_id}' >{$sup->supplier_name}</option>";
                                                                }
                                                            ?>
                                                        </optgroup>
                                                    </select>
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
                                                            <td>Action</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="table-po-body"> </tbody>
                                                </table>
                                                <div class="row">
                                                    <div class="col-md-12 text-center">
                                                        <button type="button" class="btn btn-default btn-add-item"><i class="fa fa-plus"></i> Add More Item</button>

                                                    </div>
                                                </div>
                                                <div class="form-actions">
                                                    <hr/>
                                                    <h3 class="fbold o-total">Total Purchased Item: <span class="total-item">0</span></h3>

                                                    <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total">0</span></h3>
                                                    <hr>
                                                    <div class="card-body text-right ">
                                                        <button type="submit" class="btn btn-success"> Submit </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>  

                <div class="modal fade edit_po_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" style="max-width:900px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Edit Purchase Order</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form id="Purchase_Order_edit_form" action="#" method="POST">
                                    <div class="form-body">
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <input type="hidden" name="po_edit_id" class="po_edit_id">
                                                    <label class="fbold" for="supplier">Select Supplier</label>
                                                    <select name="supplier" class="supplier_select_edit form-control" style="width: 100%;">
                                                        <optgroup label="Select Supplier">
                                                            <?php
                                                                foreach ($suppliers as $sup) {
                                                                    echo "<option value='{$sup->PK_supplier_id}' >{$sup->supplier_name}</option>";
                                                                }
                                                            ?>
                                                        </optgroup>
                                                    </select>
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
                                                            <td>Action</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="table-po-body-edit"> </tbody>
                                                </table>
                                                <div class="row">
                                                    <div class="col-md-12 text-center">
                                                        <button type="button" class="btn btn-default btn-add-item"><i class="fa fa-plus"></i> Add More Item</button>

                                                    </div>
                                                </div>
                                                <div class="form-actions">
                                                    <hr/>
                                                    <h3 class="fbold o-total">Total Purchased Item: <span class="total-item">0</span></h3>

                                                    <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total">0</span></h3>
                                                    <hr>
                                                    <div class="card-body text-right ">
                                                        <button type="submit" class="btn btn-success"> Update </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>                                              


                <!-- start -->
                <div class="modal fade view_received_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" style="max-width:900px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Received Purchase Order</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <div class="form-body">
                                    <div class="card-body">
                                        <div class="form-row mb-4">
                                            <div class="col-md-4">
                                                <label class="fbold" for="supplier">Purchase Order ID:</label>
                                                <div class="div_value purchase_no_received">sample text</div>
                                            </div>
                                        </div>                        
                                        <div class="row">
                                            <div class="col-md-3">
                                                <label class="fbold" for="supplier">Supplier</label>
                                                <div class="div_value po_receive_supplier">sample text</div>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="fbold" for="supplier">Date Received</label>
                                                <div class="div_value po_received_date">sample text</div>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="fbold" for="supplier">Received By</label>
                                                <div class="div_value po_received_by">John Doe</div>
                                            </div>
                                            <div class="col-md-3">
                                                <label class="fbold" for="supplier">Counter Checked By</label>
                                                <div class="div_value po_counter_by">John Doe</div>
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
                                                                          
                                                    <button type="button" class="btn btn-success btn-generate-arf"> Generate ARF</button>
                                                    <button type="button" class="btn btn-danger" data-dismiss="modal"> Close</button>
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


                <!-- start -->
                <div class="modal fade receive_po_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-lg" style="max-width:1000px;">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Received Purchase Order</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="#" method="post" id="frm_received_po">
                                    <input type="hidden" name="po_id" class="po_received_id">
                                    <div class="form-body">
                                        <div class="card-body">
                                            <!-- <div class="form-row mb-4">
                                                <div class="col-md-4">
                                                    <label class="fbold" for="supplier">Purchase Order No:</label>
                                                    <input type="text" id="purchase_no" required class="form-control">
                                                </div>
                                            </div> -->
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label class="fbold" for="supplier">Supplier</label>
                                                    <div class="div_value po_receive_supplier2">sample text</div>
                                                </div>
                                                <div class="col-md-4">
                                                    <label class="fbold" for="supplier">Date Receiving</label>
                                                    <div class="div_value po_received_date2">sample text</div>
                                                </div>


                                                <div class="col-md-12">
                                                    <div class="form-row mt-3">
                                                        <div class="col-md-3">
                                                                <label class="fbold" for="supplier">Counter Checked By:</label>
                                                        <input type="text" class="form-control" required name="counter_checked">
                                                    </div>        
                                                    </div> 
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
                                                            <td>Exp. Date</td>
                                                            <td>Received Qty.</td>
                                                        </tr>
                                                    </thead>
                                                    <tbody class="table-po-body-toreceive"> </tbody>
                                                </table>
                                                <div class="form-actions">
                                                    <hr/>
                                                    <div class="row">
                                                        <div class="col-md-5">
                                                            <h3 class="fbold o-total">Total Purchased Item: <span class="total-item-received2">0</span></h3>

                                                            <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total-received2">0</span></h3>
                                                        </div>
                                                        <div class="col-md-7">
                                                            <label for="" class="fbold">Discrepancy Reason: </label>
                                                            <textarea id="discrepancy_reason" name="discrepancy_reason" class="form-control" ></textarea>
                                                        </div>
                                                    </div>
                                                    <hr>
                                                    <div class="card-body text-right ">
                                                        <button type="submit" class="btn btn-success"> Submit</button>                            
                                                        <button type="button" class="btn btn-danger" data-dismiss="modal" aria-label="Close"> Close</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                            
                                </form>
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
