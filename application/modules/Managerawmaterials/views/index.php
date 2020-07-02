
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
                        <button type="button" class="btn btn-info theme-bg add_new"><i class="fa fa-plus-circle"></i> Add New</button>
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
                                    <table id="raw_Materials" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Material ID</th>
                                                <th class="text-center">Category</th>
                                                <th class="text-center">Name</th>
                                                <th class="text-center">Unit</th>
                                                <!-- <th class="text-center">Average Cost (₱)</th> -->
                                                <th class="text-center">Sales Price (₱)</th>
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
                        <h5 class="modal-title">Add Raw Material</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="Raw_Material_Add" action="#">
                                <div class="form-body">
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-4">
                                                <div class="form-group">
                                                    <label>Related Item:</label>
                                                    <input type="hidden" name="related_item_id" value="">
                                                    <select style="width:100%" class="form-control" name="related_item">
                                                      <!-- <optgroup label="Select Related Item: "></option>
                                                        <option value="" selected></option>
                                                      <?php foreach ($items as $item) {
                                                          echo "<option value='{$item->PK_raw_materials_id}'>{$item->material_name}<option>";
                                                      } ?>
                                                      </optgroup> -->
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
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
                                                      <option value="" selected>Select Category</option>
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
                                                    <select name="unit" class="form-control mat_units"></select>  
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <!-- <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Average Cost</label>
                                                    <input type="number" class="form-control" name="average_cost">
                                                </div>
                                            </div> -->
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                  <label>Sales Price</label>
                                                  <input type="number" step="0.01" class="form-control" name="sales_price">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <div class="form-actions">
                                            <div class="card-body text-center">
                                                <button type="submit" class="btn btn-success"> <i class="fa fa-check"></i> Add</button>
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

                <div class="modal fade view_details_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Raw Material Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form action="#">
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
                                                    <input type="text" class="form-control" name="category">
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Unit</label>
                                                    <input type="text" class="form-control" readonly name="unit">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <!-- <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Average Cost</label>
                                                    <input type="text" class="form-control" name="average_cost">
                                                </div>
                                            </div> -->
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                  <label>Sales Price</label>
                                                  <input type="text" class="form-control" name="sales_price">
                                                </div>
                                            </div>
                                            <!--/span-->
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
                                                    <select name="unit" class="form-control mat_units"></select>  
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <div class="row">
                                            <!-- <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>Average Cost</label>
                                                    <input type="number" class="form-control" name="average_cost">
                                                </div>
                                            </div> -->
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                  <label>Sales Price</label>
                                                  <input type="number" step="0.01" class="form-control" name="sales_price">
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
