
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
                    <div class="col-md-7 align-self-center">
                        <h3 class="text-themecolor"><?= $title ?></h3>
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="javascript:void(0)">Home</a></li>
                            <li class="breadcrumb-item active"><?= $title ?></li>
                        </ol>
                    </div>

                    <div class="col-md-5 align-self-center text-right d-none d-md-block">
                      <!-- With Week Numbers -->
                      <div class='input-group mb-3'>
                          <input type='text' class="form-control pending_deliveries" />
                          <div class="input-group-append">
                              <span class="input-group-text">
                                  <span class="ti-calendar"></span>
                              </span>
                          </div>
                      </div>
                      <div class="mb-6">
                        <form class="export" action="<?= base_url('ManageReports/generatePendingReports') ?>" method="post">
                            <input type="hidden" name="date_start" value="<?= date('Y-m-d') ?>">
                            <input type="hidden" name="date_end" value="<?= date('Y-m-d') ?>">
                            <button type="submit" class="btn btn-info theme-bg"><i class="fa fa-download"></i> Export </button>
                        </form>
                      </div>

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
                                    <table id="pending_reports" class="table table-bordered table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Total Items</th>
                                                <th>Type</th>
                                                <th>Date Added</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>TR-19</td>
                                                <td>2</td>
                                                <td>Stock Transfer</td>
                                                <td>04/09/2020</td>
                                            </tr>
                                            <tr>
                                                <td>TR-20</td>
                                                <td>2</td>
                                                <td>Stock Transfer</td>
                                                <td>04/13/2020</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade add_stock_transfer_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog ">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Transfer Item</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="Purchase_Order_Add" action="#">
                                <div class="form-body">
                                    <div class="card-body">
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>From:</label>
                                                  <p>Bajada</p>
                                              </div>
                                          </div>
                                          <!--/span-->
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>To:</label>
                                                  <select class="form-control" name="">
                                                    <option value="">Toril</option>
                                                    <option value="">Tagum</option>
                                                    <option value="">Commisary</option>
                                                  </select>
                                              </div>
                                          </div>
                                          <!--/span-->
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Item Name:</label>
                                                  <select class="form-control" name="">
                                                    <option value="">Sample Name</option>
                                                  </select>
                                              </div>
                                          </div>
                                          <!--/span-->
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Quantity:</label>
                                                  <input type="number" class="form-control" name="" value="">
                                              </div>
                                          </div>
                                          <!--/span-->
                                      </div>
                                      <div class="row">
                                          <div class="col-md-12 text-right">
                                              <div class="form-group">
                                                  <label>Status: </label><em> Pending</em>
                                              </div>
                                          </div>
                                      </div>
                                        <div class="form-actions">
                                            <div class="card-body text-right">
                                                <button type="submit" class="btn btn-success"> Submit </button>
                                            </div>
                                        </div>
                                      </div>
                                    </div>
                            </form>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="modal fade tot_purchase_view_details_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
                                                    <label class="control-label col-md-6">Supplier Name</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static"> Sample Name </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label col-md-6">P.O Number</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static"> PO123 </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label col-md-6">Total Items</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static"> 100 </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                      <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group row">
                                                    <label class="control-label col-md-6">Total Cost</label>
                                                    <div class="col-md-6">
                                                        <p class="form-control-static"> 1, 000 </p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-actions">
                                            <div class="card-body text-center">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
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
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Edit Raw Material Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="Raw_Material_Edit" action="#">
                                <div class="form-body">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-12 ">
                                                <div class="form-group">
                                                    <label>Raw Material</label>
                                                    <input type="text" class="form-control" name="material_name">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Category</label>
                                                    <select class="form-control custom-select" name="category">
                                                        <?php foreach ($categories as $cat): ?>
                                                                  <option value="<?= $cat['PK_category_id'] ?>"><?= $cat['category_name'] ?></option>
                                                        <?php endforeach; ?>
                                                    </select>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Unit</label>
                                                    <input type="text" class="form-control" name="unit">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Average Cost</label>
                                                    <input type="number" class="form-control" name="average_cost">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                  <label>Sales Price</label>
                                                  <input type="number" class="form-control" name="sales_price">
                                                </div>
                                            </div>
                                            <!--/span-->
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
