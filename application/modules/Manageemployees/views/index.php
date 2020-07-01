
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
                        <button type="button" class="btn btn-info theme-bg " data-toggle="modal" data-target=".add_employee_modal"><i class="fa fa-plus-circle"></i> Add New</button>
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
                                    <table id="table_employees" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <th class="text-center">Employee ID</th>
                                                <th class="text-center">Employee Name</th>
                                                <th class="text-center">Email Address</th>
                                                <th class="text-center"> Date Added </th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                          <tr>
                                            <td>1</td>
                                            <td>Sample Name</td>
                                            <td>Bajada</td>
                                            <td>09123456789</td>
                                            <td>09123456789</td>
                                          </tr>
                                        </tbody>
                                    </table>
                                </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade add_employee_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Add Employee</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="Employee_Add" action="#">
                                <div class="form-body">
                                    <div class="card-body">
                                      <div class="row">
                                          <div class="col-md-6 ">
                                              <div class="form-group">
                                                  <label>First Name</label>
                                                  <input type="text" class="form-control" name="first_name">
                                              </div>
                                          </div>
                                          <div class="col-md-6 ">
                                              <div class="form-group">
                                                  <label>Last Name</label>
                                                  <input type="text" class="form-control" name="last_name">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Age:</label>
                                                  <input type="text" class="form-control" name="age">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                <label>Gender:</label><br>
                                                <input type="radio" id="male" name="gender" value="male">
                                                <label for="male">Male</label><br>
                                                <input type="radio" id="female" name="gender" value="female">
                                                <label for="female">Female</label><br>

                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Email Address:</label>
                                                  <input type="text" class="form-control" name="email_address">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Assigned Outlet:</label>
                                                  <select class="form-control custom-select" name="outlet_id">
                                                    <option value="" selected>Select Outlet</option>
                                                      <?php foreach ($outlets as $outlet): ?>
                                                                <option value="<?= $outlet['PK_branch_id'] ?>"><?= $outlet['outlet_name'] ?></option>
                                                      <?php endforeach; ?>
                                                  </select>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Username:</label>
                                                  <input type="text" class="form-control" name="username">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Password:</label>
                                                  <input type="password" class="form-control" name="password">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Address:</label>
                                                  <input type="text" class="form-control" name="address">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Position:</label>
                                                  <select class="form-control custom-select" name="user_type">
                                                    <option value="" selected>Select Outlet</option>
                                                    <option value="2" >Outlet Admin</option>
                                                    <option value="3" >Purchaser</option>
                                                    <option value="4" >Supervisor</option>
                                                  </select>
                                              </div>
                                          </div>
                                      </div>
                                        <!--/row-->
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

                <div class="modal fade view_employee_details_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Employee Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form action="#">
                                <div class="form-body">
                                    <div class="card-body">
                                      <div class="row">
                                          <div class="col-md-6 ">
                                              <div class="form-group">
                                                  <label>First Name</label>
                                                  <input type="text" class="form-control" name="first_name">
                                              </div>
                                          </div>
                                          <div class="col-md-6 ">
                                              <div class="form-group">
                                                  <label>Last Name</label>
                                                  <input type="text" class="form-control" name="last_name">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Age:</label>
                                                  <input type="text" class="form-control" name="age">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                <label>Gender:</label><br>
                                                <input type="radio" id="male" name="gender" value="male">
                                                <label for="male">Male</label><br>
                                                <input type="radio" id="female" name="gender" value="female">
                                                <label for="female">Female</label><br>

                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Email Address:</label>
                                                  <input type="text" class="form-control" name="email_address">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Assigned Outlet:</label>
                                                  <select class="form-control custom-select" name="outlet_id">
                                                    <option value="" selected>Select Outlet</option>
                                                      <?php foreach ($outlets as $outlet): ?>
                                                                <option value="<?= $outlet['PK_branch_id'] ?>"><?= $outlet['outlet_name'] ?></option>
                                                      <?php endforeach; ?>
                                                  </select>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Username:</label>
                                                  <input type="text" class="form-control" name="username">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Password:</label>
                                                  <input type="password" class="form-control" name="password">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Address:</label>
                                                  <input type="text" class="form-control" name="address">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Position:</label>
                                                  <select class="form-control custom-select" name="user_type">
                                                    <option value="" selected>Select Outlet</option>
                                                    <option value="2" >Outlet Admin</option>
                                                    <option value="3" >Purchaser</option>
                                                    <option value="4" >Supervisor</option>
                                                  </select>
                                              </div>
                                          </div>
                                      </div>
                                        <!--/row-->
                                    </div>
                                </div>
                            </form>
                      </div>
                    </div>
                  </div>
                </div>

                <div class="modal fade edit_employee_details_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
                  <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                      <div class="modal-header">
                        <h5 class="modal-title">Edit Employee Information</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                        </button>
                      </div>
                      <div class="modal-body">
                        <form id="Employee_Edit" action="#">
                                <input type="hidden" name="user_id" value="">
                                <div class="form-body">
                                    <div class="card-body">
                                      <div class="row">
                                          <div class="col-md-6 ">
                                              <div class="form-group">
                                                  <label>First Name</label>
                                                  <input type="text" class="form-control" name="first_name">
                                              </div>
                                          </div>
                                          <div class="col-md-6 ">
                                              <div class="form-group">
                                                  <label>Last Name</label>
                                                  <input type="text" class="form-control" name="last_name">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Age:</label>
                                                  <input type="text" class="form-control" name="age">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                <label>Gender:</label><br>
                                                <input type="radio" id="male" name="gender" value="male">
                                                <label for="male">Male</label><br>
                                                <input type="radio" id="female" name="gender" value="female">
                                                <label for="female">Female</label><br>

                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Email Address:</label>
                                                  <input type="text" class="form-control" name="email_address">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Assigned Outlet:</label>
                                                  <select class="form-control custom-select" name="outlet_id">
                                                    <option value="" selected>Select Outlet</option>
                                                      <?php foreach ($outlets as $outlet): ?>
                                                                <option value="<?= $outlet['PK_branch_id'] ?>"><?= $outlet['outlet_name'] ?></option>
                                                      <?php endforeach; ?>
                                                  </select>
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Username:</label>
                                                  <input type="text" class="form-control" name="username">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Password:</label>
                                                  <input type="password" class="form-control" name="password">
                                              </div>
                                          </div>
                                      </div>
                                      <div class="row">
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Address:</label>
                                                  <input type="text" class="form-control" name="address">
                                              </div>
                                          </div>
                                          <div class="col-md-6">
                                              <div class="form-group">
                                                  <label>Position:</label>
                                                  <select class="form-control custom-select" name="user_type">
                                                    <option value="" selected>Select Outlet</option>
                                                    <option value="2" >Outlet Admin</option>
                                                    <option value="3" >Purchaser</option>
                                                    <option value="4" >Supervisor</option>
                                                  </select>
                                              </div>
                                          </div>
                                      </div>
                                        <!--/row-->
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
