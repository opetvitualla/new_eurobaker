
$(document).ready(function () {
	// var purchase_orders = $('#purchase_Orders').DataTable();
	var base_url = $('.base_url').val();

	dataTableReport()

	function dataTableReport(date_to = "", date_from = "") {
		$('#total_purchase_table').DataTable({
			"language": { "infoFiltered": "" },
			"destroy": true,
			"processing": true, //Feature control the processing indicator.
			"serverSide": true, //Feature control DataTables' server-side processing mode.
			"responsive": true,
			buttons: [
				'excel'
			],
			dom: 'Bfrtip',
			"order": [
				[0, 'desc']
			], //Initial no order.
			"createdRow": function (row, data, dataIndex) {
				if (data.status == "received") {
					$(row).addClass("row_po_received");
				}
			},
			"columns": [
				{
					"data": "PK_stock_out_id",
					"render": function (data, type, row, meta) {
						var str = 'SO-' + row.PK_stock_out_id;
						return str;
					}
				},
				{
					"data": "segment_name"
				},
				{
					"data": "total_items"
				},
				{
					"data": "total_amount"
				},
				{
					"data": "firstname"
				},
				{
					"data": "status"
				},
				{
					"data": "date_added"
				}
			],
			"ajax": {
				"url": base_url + "total_stockout/get_stockout_data",
				"type": "POST",
				"data": { date_to: date_to, date_from: date_from }
			},
			"columnDefs": [{
				"targets": [3],
				"orderable": false,
			},],
		});
		$(".buttons-excel span").text("Export Excel");
	}


	$(".date-from").change(function () {
		let date_from = $(this).val();
		let date_to = $(".date-to").val();

		if (date_to != "" && date_from != "") {
			dataTableReport(date_to, date_from);
		}


	})

	$(".buttons-excel span").text("Export Excel");

	$(".date-to").change(function () {
		let date_from = $(".date-from").val();
		let date_to = $(this).val();

		if (date_to != "" && date_from != "") {
			dataTableReport(date_to, date_from);
		}
	})

	function is_item_exist(item_id) {

		let count = 0;
		$(".itemselect").each(function (e, index) {
			var sel_value = $("option:selected", this).attr("data-id");
			if (item_id == sel_value) {
				count++;
			}
		})

		if (count == 2) {
			return true;
		}

		return false;
	}

	function validated_table(validate_type = "add") {
		let resp = true;
		let form_id = "Purchase_Order_Add";

		if (validate_type != "add") {
			form_id = "Purchase_Order_edit_form"
		}

		$("#" + form_id + " .itemselect").each(function () {
			if ($(this).val() == "") {
				resp = false;
			}
		})
		$("#" + form_id + " .item-price").each(function () {
			if ($(this).val() == "") {
				resp = false;
			}
		})

		return resp;
	}

	// useful functions
	function calculateTotal(price, qty) {
		return Number(price) * Number(qty);
	}

	function generateOverTotal() {
		let over_total = 0;
		let count = 0;
		let mod = "add_po_modal";
		if (!is_add_item) {
			mod = "edit_po_modal";
		}
		$("." + mod + " .item-total").each(function (e) {

			over_total += Number($(this).val());
			count++;
		})

		$(".total-item").html(count)
		$(".over-total").html(over_total.toFixed(2))
	}

})


