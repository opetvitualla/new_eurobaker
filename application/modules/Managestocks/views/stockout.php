
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
                        <button type="button" class="btn btn-info" data-toggle="modal" data-target=".add_stock_out_modal"><i class="fa fa-external-link"></i> New Request</button>
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
                                    <table id="stock_Out" class="table table-bordered table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th>Request ID</th>
                                                <th>Requested By</th>
                                                <th>Total Items</th>
                                                <th>Total Amount</th>
                                                <th>Date Added</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>RQ-1111</td>
                                                <td>John Doe</td>
                                                <td>10</td>
                                                <td>1,000</td>
                                                <td>2012/04/25</td>
                                                <td><span class="fa fa-eye stock_out_view_details"></span></td>
                                            </tr>
                                            <tr>
                                                <td>RQ-1112</td>
                                                <td>John Doe</td>
                                                <td>5</td>
                                                <td>3,000</td>
                                                <td>2012/04/25</td>
                                                <td><span class="fa fa-eye stock_out_view_details"></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade add_stock_out_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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

                <div class="modal fade stock_out_view_details_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
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
                                      <div class="row">
                                          <div class="col-md-6 text-left">
                                              <div class="form-group">
                                                  <label>Requested by: <span>Distrib, Inc.</span></label>
                                              </div>
                                          </div>
                                          <!--/span-->
                                          <div class="col-md-6 text-right">
                                              <div class="form-group">
                                                <label>Requested Date: <span>03-03-2020</span></label>

                                              </div>
                                          </div>
                                          <!--/span-->
                                      </div>
                                      <div class="table-responsive m-t-40">
                                          <table id="stock_Out" class="table table-bordered table-striped text-center">
                                              <thead>
                                                  <tr>
                                                      <th>Item Name</th>
                                                      <th>Item Description</th>
                                                      <th>Total Items</th>
                                                      <th>Total Cost</th>
                                                      <th>Actions</th>
                                                  </tr>
                                              </thead>
                                              <tbody>
                                                  <tr>
                                                      <td>Sugar</td>
                                                      <td>Sample Description</td>
                                                      <td>1</td>
                                                      <td>100</td>
                                                      <td><span class="fa fa-edit"></span><span class="fa fa-trash"></span></i></td>
                                                  </tr>
                                                  <tr>
                                                      <td>Flour</td>
                                                      <td>Sample Description</td>
                                                      <td>2</td>
                                                      <td>200</td>
                                                      <td><span class="fa fa-edit"></span><span class="fa fa-trash"></span></i></td>
                                                  </tr>
                                              </tbody>
                                          </table>
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
