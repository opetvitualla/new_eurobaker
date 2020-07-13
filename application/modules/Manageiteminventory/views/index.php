
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
                        <a  href="<?=base_url("inventory_movements")?>"  class="btn btn-info theme-bg" ><i class="fa fa-cube"></i> Inventory Movements</a>
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
                    <div class="col-12">
                        <div class="card">
                                <div class="table-responsive m-t-40">
                                    <table id="item_Inventory" class="table table-bordered table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th>Item ID</th>
                                                <th>Item Name</th>
                                                <th>Amount</th>
                                                <th>Beg. Inventory</th>
                                                <th>Qty.</th>
                                                <th>Status</th>
                                                <th>Date Added</th>
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

                <div class="modal fade add_raw_material_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Add Product Order</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="Purchase_Order_Add" action="#">
                                <div class="form-body">
                                    <div class="card-body">
                                      <div class="form-row">
                                        <div class="form-group col-md-4">
                                          <label for="inputCity">Item Name</label>
                                          <input type="text" class="form-control" id="inputCity">
                                        </div>
                                        <div class="form-group col-md-2">
                                          <label for="inputState">Quantity</label>
                                          <input type="number" class="form-control" name="" value="">
                                        </div>
                                        <div class="form-group col-md-2">
                                          <label for="inputZip">Item Unit</label>
                                          <input type="text" class="form-control" id="inputZip">
                                        </div>
                                        <div class="form-group col-md-2">
                                          <label for="inputZip">Price</label>
                                          <input type="text" class="form-control" id="inputZip">
                                        </div>
                                        <div class="form-group col-md-2 text-center">
                                          <label for="inputZip">Action</label>
                                          <div class="mx-auto">
                                            <span class="mx-auto fa fa-trash"></span>
                                          </div>
                                        </div>
                                      </div>
                                        <div class="form-actions">
                                            <div class="card-body text-right">
                                                <button type="submit" class="btn btn-success"> Save Items </button>
                                            </div>
                                        </div>
                                      </div>
                                    </div>
                            </form>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="modal fade view_details_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title text-center">Item Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form action="#">
                                <div class="form-body">
                                    <div class="card-body">
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-6">Item Name:</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static name"> Sample Name </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-6">Amount:</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static amount"> 500.00 </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-6">Beginning Inventory:</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static beginning_inventory"> 500</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-6">Quantity</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static quantity"> 150 </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-6">Status:</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static status in_stock"> In-Stock </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-6">Date Added:</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static status date_added"> In-Stock </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label text-right col-md-6">Date Modified:</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static status date_modified"> In-Stock </p>
                                                    </div>
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

                <div class="modal fade edit_details_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Edit Item Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="Raw_Material_Edit" action="#">
                                <div class="form-body">
                                    <div class="card-body text-center">
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label col-md-6">SKU:</label>
                                                    <div class="col-md-6">
                                                      <input type="text" class="form-control" name="" value="Distrib, Inc.">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label col-md-6">Name:</label>
                                                    <div class="col-md-6">
                                                      <input type="text" class="form-control" name="" value="Sample Name">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label col-md-6">Amount:</label>
                                                    <div class="col-md-6">
                                                        <input type="text" class="form-control" name="" value="500.00">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label col-md-6">Quantity</label>
                                                    <div class="col-md-6">
                                                      <input type="number" class="form-control" name="" value="150">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label col-md-6">Status:</label>
                                                    <div class="col-md-6">
                                                      <select class="form-control" name="">
                                                        <option value="" selected>In-Stock</option>
                                                        <option value="">Out of Stock</option>
                                                      </select>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <div class="card-body text-center">
                                                <button type="submit" class="btn btn-success edit_Button"> <i class="fa fa-check"></i> Save</button>
                                                <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">Cancel</button>
                                            </div>
                                        </div>
                                      </div>
                                    </div>
                            </form>
                      </div>
                    </div>
                  </div>
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
