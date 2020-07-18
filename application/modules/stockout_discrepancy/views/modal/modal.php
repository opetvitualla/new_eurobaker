<div class="modal fade discrepancy_modal" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" style="max-width:900px;">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Stock Out Discrepancy</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="form-body">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3">
                                <label class="fbold" for="supplier">Segment</label>
                                <div class="div_value sd_segment">sample text</div>
                            </div>
                            <div class="col-md-3">
                                <label class="fbold" for="supplier">Stock Out No:</label>
                                <div class="div_value so_number">sample text</div>
                            </div>
                            <div class="col-md-3">
                                <label class="fbold" for="supplier">Approved By</label>
                                <div class="div_value so_approve_by">John Doe</div>
                            </div>
                            <div class="col-md-3">
                                <label class="fbold" for="supplier">Requested By</label>
                                <div class="div_value so_req_by">John Doe</div>
                            </div>
                            <div class="col-md-12">
                                <hr> </div>
                        </div>
                        <div class="cont-po">

                            <table class="table table-bordered po-table">
                                <thead>
                                    <tr>
                                        <td>Item Name</td>
                                        <td>Requested Qty.</td>
                                        <td>Received Qty.</td>
                                        <td>Item Unit</td>
                                    </tr>
                                </thead>
                                <tbody class="table-so-body-disc"> </tbody>
                            </table>

                            <div class="notes_disc">
                                <div class="fbold mt-4">Note:</div>
                                <div class="mt-3 txt_desc_note"></div>
                                <hr>
                            </div>
                            <div class="form-actions">
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