<div class="modal fade add_so_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Request Form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="Stock_out_Add" action="#" method="POST">
                    <div class="form-body">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="fbold" for="supplier">Select Segment</label>
                                    <select name="segment_id" class="supplier_select form-control" style="width: 100%;">
                                        <optgroup label="Select Segment">
                                            <?php
                                                foreach ($segments as $seg) {
                                                    echo "<option value='{$seg->PK_segment_id}' >{$seg->segment_name}</option>";
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
                                    <h3 class="fbold o-total">Total Items: <span class="total-item">0</span></h3>

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


<!-- start -->
<div class="modal fade edit_so_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Purchase Order</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="stock_out_edit_form" action="#" method="POST">
                    <div class="form-body">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="hidden" name="so_edit_id" class="so_edit_id">
                                    <label class="fbold" for="supplier">Select Supplier</label>
                                    <select name="supplier" class="supplier_select_edit form-control" style="width: 100%;">
                                        <optgroup label="Select Supplier">
                                            <?php
                                                foreach ($segments as $seg) {
                                                    echo "<option value='{$seg->PK_segment_id}' >{$seg->segment_name}</option>";
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
<div class="modal fade approved_so_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Approved Stock Out</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="stock_out_approved_form" action="#" method="POST">
                    <div class="form-body">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="hidden" name="so_app_id" class="so_app_id">
                                    <label class="fbold" for="supplier">Segment</label>
                                    <div class="div_value so_receive_segment">sample text</div>
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
                                            <td>Received Qty.</td>
                                        </tr>
                                    </thead>
                                    <tbody class="table-po-body-approve"> </tbody>
                                </table>
                                <div class="form-actions">
                                    <hr/>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <h3 class="fbold o-total">Total Purchased Item: <span class="total-item">0</span></h3>
                                            <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total">0</span></h3>
                                        </div>
                                        <div class="col-md-7">
                                            <label for="" class="fbold">Discrepancy Reason: </label>
                                            <textarea id="discrepancy_reason" name="discrepancy_reason" class="form-control" ></textarea>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="card-body text-right ">
                                        <button type="submit" class="btn btn-success"> Approve </button>
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

<div class="modal fade view_so_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Stock Out Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="stock_out_approved_form" action="#" method="POST">
                    <div class="form-body">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="hidden" name="so_app_id" class="so_app_id">
                                    <label class="fbold" for="supplier">Segment:</label>
                                    <div class="div_value so_view_segment">sample text</div>
                                </div>
                                <div class="col-md-4">
                                    <label class="fbold" for="supplier">Requested By:</label>
                                    <div class="div_value so_view_requested">sample text</div>
                                </div>
                                <div class="col-md-4">
                                    <label class="fbold" for="supplier">Approved By:</label>
                                    <div class="div_value so_view_approved">sample text</div>
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
                                    <tbody class="table-po-body-approved"> </tbody>
                                </table>
                                <div class="form-actions">
                                    <hr/>
                                    <div class="row">
                                        <div class="col-md-5">
                                            <h3 class="fbold o-total">Total Purchased Item: <span class="total-item">0</span></h3>
                                            <h3 class="fbold">Overall Total: <span>&#8369;</span><span class="over-total">0</span></h3>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="card-body text-right ">
                                        <button type="button" data-dismiss="modal" class="btn btn-success" > Close </button>
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