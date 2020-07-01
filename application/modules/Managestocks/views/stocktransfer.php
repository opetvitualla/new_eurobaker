
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
                        <button type="button" class="btn btn-info theme-bg show-add-modal" data-toggle="modal" data-target=".add_stock_transfer_modal"><i class="fa fa-plus-circle"></i> Transfer </button>
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
                                    <table id="stock_Transfer" class="table table-bordered table-striped text-center">
                                        <thead>
                                            <tr>
                                                <th>Transfer ID</th>
                                                <th>Qty.</th>
                                                <th>Transfer To</th>
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

                <div class="modal fade add_stock_transfer_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Transfer Item </h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="Stock_Transfer_Add" action="#">
                                <div class="form-body">
                                    <div class="card-body">
                                      <div class="row">
                                          <div class="col-md-8">
                                              <div class="form-group">
                                                  <label>From:</label>
                                                  <p>Bajada</p>
                                              </div>
                                          </div>
                                          <!--/span-->
                                          <div class="col-md-4">
                                              <div class="form-group">
                                                  <label>To:</label>
                                                  <select class="form-control select2" name="destination_branch_id">
                                                    <option value="2">Tagum</option>
                                                    <option value="3">Toril</option>
                                                    <option value="4">Commisary</option>
                                                  </select>
                                              </div>
                                          </div>
                                          <!--/span-->
                                      </div>
                                      <div class="row">
                                          <div class="col-md-4">
                                              <div class="form-group">
                                                  <label>STR No./BI no.:</label>
                                                  <input type="number" class="form-control" name="str_no" value="">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                        <table class="table table-bordered po-table transfer">
                                            <thead>
                                                <tr>
                                                    <td>Item Name</td>
                                                    <td>Quantity</td>
                                                    <td style="width: 122px;">Item Unit</td>
                                                    <td style="width: 122px;">Price</td>
                                                    <td>Action</td>
                                                </tr>
                                            </thead>
                                            <tbody class="table-po-body"> </tbody>
                                        </table>
                                      </div>
                                      <div class="row">
                                              <div class="col-md-12 text-center">
                                                  <button type="button" class="btn btn-default btn-add-item transfer"><i class="fa fa-plus"></i> Add More Item</button>

                                              </div>
                                      </div>
                                        <div class="form-actions">
                                            <hr/>
                                            <h3 class="fbold o-total">Total Items: <span class="total-item">0</span></h3>
                                            <h3 class="fbold o-total">Status: <span><em> Pending</em></span></h3>

                                            <!-- <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total">0</span></h3> -->
                                            <hr>
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

                <div class="modal fade edit_stock_transfer_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Transfer Item</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="Stock_Transfer_Edit" action="#">
                          <input type="hidden" class="transferred_id" value="">
                                <div class="form-body">
                                    <div class="card-body">
                                      <div class="row">
                                          <div class="col-md-8">
                                              <div class="form-group">
                                                  <label>From:</label>
                                                  <p>Bajada</p>
                                              </div>
                                          </div>
                                          <!--/span-->
                                          <div class="col-md-4">
                                              <div class="form-group">
                                                  <label>To:</label>
                                                  <select class="form-control select2" name="">
                                                    <option value="">Toril</option>
                                                    <option value="">Tagum</option>
                                                    <option value="">Commisary</option>
                                                  </select>
                                              </div>
                                          </div>
                                          <!--/span-->
                                      </div>
                                      <div class="row">
                                          <div class="col-md-4">
                                              <div class="form-group">
                                                  <label>STR No./BI no.:</label>
                                                  <input type="number" class="form-control" name="str_no" value="">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                        <table class="table table-bordered po-table-edit transfer">
                                            <thead>
                                                <tr>
                                                    <td>Item Name</td>
                                                    <td>Quantity</td>
                                                    <td style="width: 122px;">Item Unit</td>
                                                    <td>Action</td>
                                                </tr>
                                            </thead>
                                            <tbody class="table-po-body"> </tbody>
                                        </table>
                                      </div>
                                      <div class="row">
                                              <div class="col-md-12 text-center">
                                                  <button type="button" class="btn btn-default btn-add-item transfer"><i class="fa fa-plus"></i> Add More Item</button>

                                              </div>
                                      </div>
                                        <div class="form-actions">
                                            <hr/>
                                            <h3 class="fbold o-total">Total Items: <span class="total-item">0</span></h3>
                                            <h3 class="fbold o-total">Status: <span><em> Pending</em></span></h3>

                                            <!-- <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total">0</span></h3> -->
                                            <hr>
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

                <div class="modal fade transfer_view_details_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
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
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>From:</label>
                                            <p>Bajada</p>
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>To:</label>
                                            <p class="destination">Commisary</p>
                                        </div>
                                    </div>
                                    <!--/span-->
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>STR No./BI no.:</label>
                                            <p class="strno"></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                  <table class="table table-bordered po-table transfer-view">
                                      <thead>
                                          <tr>
                                              <th>Item Name</th>
                                              <th>Quantity</th>
                                              <th style="width: 122px;">Item Unit</th>
                                              <th>Action</th>
                                          </tr>
                                      </thead>
                                      <tbody class="table-po-body"> </tbody>
                                  </table>
                                </div>
                                <div class="row">
                                  <div class="col-md-7">
                                  </div>
                                  <div class="col-md-5">
                                      <div class="form-group">
                                          <label>Received by:</label>
                                          <input type="text" class="form-control" name="received_by" value="" readonly>
                                      </div>
                                      <div class="form-group">
                                          <label>Counterchecked by:</label>
                                          <input type="text" class="form-control" name="counterchecked_by" value="" readonly>
                                      </div>
                                  </div>
                                </div>
                                  <div class="form-actions">
                                      <hr/>
                                      <!-- <h3 class="fbold o-total">Total Items: <span class="total-item">0</span></h3> -->
                                      <!-- <h3 class="fbold o-total">Status: <span><em> Pending</em></span></h3> -->

                                      <!-- <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total">0</span></h3> -->
                                      <hr>
                                      <!-- <div class="card-body text-right">
                                          <button type="submit" class="btn btn-success"> Submit </button>
                                      </div> -->
                                  </div>
                                </div>
                              </div>
                            </form>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="modal fade transfer_review_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title text-center">Review Transfer Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="transfer_review" action="#">
                          <div class="form-body">
                              <div class="card-body">
                                <div class="row">
                                    <div class="col-md-8">
                                        <div class="form-group">
                                            <label>From:</label>
                                            <p>Bajada</p>
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>To:</label>
                                            <p class="destination">Commisary</p>
                                        </div>
                                    </div>
                                    <!--/span-->
                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <label>STR No./BI no.:</label>
                                            <input type="number" class="form-control" name="str_no" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                  <table class="table table-bordered po-table transfer-review">
                                      <thead>
                                          <tr>
                                              <th>Item Name</th>
                                              <th>Quantity</th>
                                              <th style="width: 122px;">Item Unit</th>
                                              <th style="width: 82px;">Actual Quantity</th>
                                          </tr>
                                      </thead>
                                      <tbody class="table-transfer-rev-body"> </tbody>
                                  </table>
                                </div>
                                <div class="row">
                                  <div class="col-md-7">
                                  </div>
                                  <div class="col-md-5">
                                      <div class="form-group">
                                          <label>Received by:</label>
                                          <input type="text" class="form-control" name="received_by" value="">
                                      </div>
                                      <div class="form-group">
                                          <label>Counterchecked by:</label>
                                          <input type="text" class="form-control" name="counterchecked_by" value="">
                                      </div>
                                  </div>
                                </div>
                                  <div class="form-actions">
                                      <!-- <hr/> -->
                                      <!-- <h3 class="fbold o-total">Total Items: <span class="total-item">0</span></h3>
                                      <h3 class="fbold o-total">Status: <span><em> Pending</em></span></h3> -->

                                      <!-- <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total">0</span></h3> -->
                                      <hr>
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
