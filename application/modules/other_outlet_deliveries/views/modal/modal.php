<div class="modal fade new_deliver_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">New delivery form</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="other_deliveries_form" action="#" method="POST">
                    <div class="form-body">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="fbold" for="supplier">Purchase Order No:</label>
                                    <select name="supplier" class="po_select form-control" style="width: 100%;">
                                    <optgroup label="Select PO">
                                       
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
                                            <td>Received Qty.</td>
                                        </tr>
                                    </thead>
                                    <tbody class="table-po-body-other"> </tbody>
                                </table>
                                <div class="form-actions mt-4">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <h3 class="fbold o-total">Total Items: <span class="total-item">0</span></h3>

                                            <h3 class="fbold o-total">Overall Total: <span>&#8369;</span><span class="over-total">0</span></h3>
                                            
                                        </div>
                                        <div class="col-md-7">
                                            <label for="" class="fbold">Discrepancy Reason: </label>
                                            <textarea id="discrepancy_reason" name="discrepancy_reason" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="card-body text-right ">
                                        <button type="submit" class="btn btn-success"> Submit </button>
                                    </div>
                                    <hr>
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