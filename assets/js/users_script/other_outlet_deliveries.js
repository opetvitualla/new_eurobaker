$(document).ready(function () {
    var base_url = $('.base_url').val();

    let items = [];
    let units = [];
    let purchase_orders = [];

    let is_add_item = false;


    $(".show-add-modal").click(function () {

        $(".table-po-body-other").html("");

        $(".total-item").val("");
        $(".over-total").val("");

        axios.get(`${base_url}Global_api/get_all_purchase_order_processing`).then(res => {
            //  suppliers = JSON.parse(res.data.data);
            if (res.data.result) {
                purchase_orders = res.data.data;

                let datas = res.data.data;
                let html = "<option value=''>Please select</option>";

                datas.map(data => {
                    html += ` <option value="${data.PK_purchase_order_id}">PO-${data.PK_purchase_order_id}</option> `;
                })


                $(".po_select").html(html);

                $(".po_select").select2();
                $(".new_deliver_modal").modal();
            }
        })

        // $(".table-po-body").html("");
        // is_add_item = true;
        // $(".total-item").html(0)
        // $(".over-total").html(0)

    })

    var table_other_order = $('#table_other_order').DataTable({
        "language": {
            "infoFiltered": ""
        },
        "processing": true, //Feature control the processing indicator.
        "serverSide": true, //Feature control DataTables' server-side processing mode.
        "responsive": true,
        "order": [
            [0, 'desc']
        ], //Initial no order.
        "createdRow": function (row, data, dataIndex) {
            if (data.status == "approved") {
                $(row).addClass("row_stock_received");
            }
        },
        "columns": [
            {
                "data": "PK_purchase_order_id",
                "render": function (data, type, row, meta) {
                    var str = 'PO-' + row.PK_purchase_order_id;
                    return str;
                }
            },
            { "data": "supplier_name" },
            { "data": "recieve_outlet" },
            { "data": "reciever_outlet" },
            { "data": "total_amount" },
            { "data": "date_added" },
            {
                "data": "PK_purchase_order_id",
                "render": function (data, type, row, meta) {
                    // var str = '<div class="mx-auto action-btn-div"> <a href="javascript:;" class="edit-btn btn_edit_po" data-id="' + row.PK_purchase_order_id + '"><i class="fa fa-edit"></i></a>';
                    // str += '<a href="javascript:;" id="view_Supplier_Details" class="po_recieved-btn text-success" data-id="' + row.PK_purchase_order_id + '" title="Receive"><i class="fa fa-check"></i></a></div>';

                    // if (row.status == "approved") {
                    str = '<div class="mx-auto action-btn-div">';
                    str += '<a href="javascript:;" class="po_view_details text-success" data-id="' + row.PK_purchase_order_id + '" title="view"><i class="fa fa-eye"></i></a></div>';
                    // }
                    return str;
                }
            },
        ],
        "ajax": {
            "url": base_url + "other_outlet_deliveries/get_other_deliveries_data",
            "type": "POST"
        },
        "columnDefs": [{
            "targets": [3],
            "orderable": false,
        },],
    });



    $(document).on('change', '.po_select', function () {
        let id = $(this).val();

        if (id == "") {
            $(".total-item").html("0")
            $(".over-total").html("0")
            $(".table-po-body-other").html("")
            return;
        }

        if (id != 0) {

            axios.get(`${base_url}other_outlet_deliveries/get_po_details/${id}`).then(res => {
                if (res.data.result) {

                    let data = res.data.data;

                    let items = data[0].po_items;

                    items.map(item => {

                        let tot = item.quantity * item.average_cost;

                        let html = `
							<tr>
								<td class="item-data" data-id="${item.FK_raw_material_id}"> ${item.material_name} </td>
							<td>
								<span class="process-qty">${item.quantity}</span>
							</td>
							<td>
								${item.item_unit}
							</td>
							<td>
                                <input class="form-control item_price" required type="text"  value="${item.average_cost}">
                            </td>
                            <td>
                                <span class="row_total">${tot.toFixed(2)}</span>
							</td>
							<td>
								<input type="number" min="0" max="${item.quantity}" value="${item.quantity}" class="form-control received-qty">
							</td>
								
							</tr>
						`
                        $(".table-po-body-other").append(html);
                    })

                    $(".total-item").html(data[0].po_items.length)
                    $(".over-total").html(data[0].total_amount)


                }
            })

        }
    })

    $("#other_deliveries_form").submit(function (e) {
        e.preventDefault();
        confirm_alert("Are you sure to recieve this purchase order?").then(res => {
            let frmdata = new FormData();
            let po_id = $(".po_select").val()

            let disc_items = [];

            $(".table-po-body-other tr.discrep_item").each(function () {
                let row = $(this);
                let item_ids = row.find(".item-data").attr("data-id")
                disc_items.push({
                    item_id: item_ids,
                    item_name: row.find(".item-data").text(),
                    quantity: row.find(".process-qty").text(),
                    rec_qty: row.find(".received-qty").val(),
                    unit: row.find(".item-unit").val(),
                })
            })

            let dreason = $("#discrepancy_reason").val();

            frmdata.append("po_id", po_id);
            frmdata.append("disc_item", JSON.stringify(disc_items));
            frmdata.append("reason", dreason);

            axios.post(`${base_url}other_outlet_deliveries/receive_purchase_order`, frmdata).then(res => {
                if (res.data.result == "success") {
                    s_alert("Received Successfully!", "success");
                    table_purchase_order.ajax.reload();
                }
            })

        })

    })


    $(document).on("change", ".item_price", function () {

        let price = Number($(this).val());

        if (isNaN(price)) {
            $(this).val(1)
            price = 1;
        }
        let row = $(this).closest('tr');

        let qty = row.find(".process-qty").html();

        let total = calculateTotal(price, qty)

        row.find(".row_total").html(total)

        generateOverTotal();


    })

    $(document).on("change", ".received-qty", function () {

        let rec_qty = Number($(this).val())
        let row = $(this).closest('tr');
        let qty_row = row.find(".process-qty");

        if (Number(qty_row.text()) > rec_qty) {
            row.addClass("discrep_item");
        } else {
            row.removeClass("discrep_item");
        }

    })


    $(document).on("click", ".btn_edit_po", function () {
        let po_id = $(this).data("id");
        is_add_item = false;
        $(".po_edit_id").val(po_id)
        axios.get(`${base_url}Managepurchaseorders/get_po_details/${po_id}`).then(res => {
            if (res.data.result == "success") {
                let datas = res.data.data;
                let po_items = datas[0].po_items
                $(".table-po-body-edit").html("")

                $(".supplier_select_edit option[value=" + datas[0].FK_supplier_id + "]").attr("selected", "selected").change()

                po_items.map(po_item => {

                    let options = "<option  value=''>Please select an item<option>";

                    items.map(item => {
                        options += `<option ${po_item.FK_raw_material_id == item.PK_raw_materials_id ? 'selected' : ''} data-id="${item.PK_raw_materials_id}" value="${item.material_name}">${item.material_name}<option>`;
                    })

                    let option_units = "";
                    units.map(unit => {
                        option_units += `<option ${po_item.item_unit == unit.unit_name ? 'selected' : ''}  data-id="${unit.PK_unit_id}" value="${unit.unit_name}">${unit.unit_name}</option>`;
                    })

                    let html = `
							<tr>
								<td>
									<select required class="itemselect form-control" style="width: 100%;">
										<optgroup label="Select an item">
											${options}
										</optgroup>
									</select>
								</td>
							
							<td>
									<input type="number" value="${po_item.quantity}"  class="form-control item-qty" name="" min="1">
							</td>
							<td>
								<select name="unit" class="form-control item-unit" required">
									${option_units}
								</select>
							</td>
							<td>
								<input required type="text" value="${po_item.price}" class="form-control item-price">
							</td>
							<td>
								<input required readonly type="text" value="${Number(po_item.quantity) * Number(po_item.price)}" class="form-control item-total">
							</td>
							<td>
								<a style="font-size:16px;" href="javascript:;" class="mx-auto fa fa-trash text-danger remove-po-item"></a>
							</td>
								
							</tr>
						`

                    $(".table-po-body-edit").append(html);
                    $(".itemselect").select2();
                })
                generateOverTotal()
            }
            $(".edit_po_modal").modal()
        })
    })

    $(document).on('click', '.po_view_details', function () {

        let id = $(this).data("id");

        $(".view_received_modal").modal()

    })

    function calculateTotal(price, qty) {
        return Number(price) * Number(qty);
    }

    function generateOverTotal() {
        let over_total = 0;
        let count = 0;
        let mod = "new_deliver_modal";

        $(".table-po-body-other .row_total").each(function (e) {

            over_total += Number($(this).html());
            count++;

            console.log(over_total)
        })

        $(".total-item").html(count)
        $(".over-total").html(over_total.toFixed(2))
    }

})