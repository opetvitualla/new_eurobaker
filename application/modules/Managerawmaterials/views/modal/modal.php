<div class="modal fade add_unit_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Unit</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="unit_modal_form" action="#" method="POST">
                    <div class="form-body">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="fbold">Select Item</label>
                                    <select name="item_selects" class="item_dropdown form-control" style="width: 100%;">
                                        <optgroup label="Select Item">
                                            
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
                                            <td>Unit of Measurement</td>
                                            <td style="width: 122px;">Value</td>
                                            <td>New Unit</td>
                                            <td style="width: 122px;">Value</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <tbody class="table-unit-body">
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <button type="button" class="btn btn-default btn-add-item-unit"><i class="fa fa-plus"></i> Add More Item</button>

                                    </div>
                                </div>
                                <div class="form-actions">
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


<!-- edit modal -->
<div class="modal fade edit_unit_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Unit</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="unit_modal_edit_form" action="#" method="POST">
                    <div class="form-body">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-4">
                                    <label class="fbold">Item Name:</label>
                                    <div class="unit_item_name">asd</div>
                                    <input type="hidden" id="unit_con_id">
                                    <input type="hidden" id="unit_item_id">
                                </div>
                                <div class="col-md-12">
                                    <hr> </div>
                            </div>
                            <div class="cont-po">

                                <table class="table table-bordered po-table">
                                    <thead>
                                        <tr>
                                            <td>Item Name</td>
                                            <td>Unit of Measurement</td>
                                            <td style="width: 122px;">Value</td>
                                            <td>New Unit</td>
                                            <td style="width: 122px;">Value</td>
                                            <td>Action</td>
                                        </tr>
                                    </thead>
                                    <tbody class="table-unit-body-edit">
                                    </tbody>
                                </table>
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <button type="button" class="btn btn-default btn-edit-item-unit"><i class="fa fa-plus"></i> Add More Item</button>

                                    </div>
                                </div>
                                <div class="form-actions">
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
