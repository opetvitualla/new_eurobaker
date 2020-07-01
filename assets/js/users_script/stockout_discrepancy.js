$(document).ready(function () {
	// var purchase_orders = $('#purchase_Orders').DataTable();
	var base_url = $('.base_url').val();

	var table_disc = $('#table_disc').DataTable({
		"language": {
			"infoFiltered": ""
		},
		"processing": true, //Feature control the processing indicator.
		"serverSide": true, //Feature control DataTables' server-side processing mode.
		"responsive": true,
		"order": [
			[0, 'desc']
		], //Initial no order.
		"createdRow": function (row, data, dataIndex) {},
		"columns": [{
				"data": "fk_stock_out_id",
				"render": function (data, type, row, meta) {
					var str = 'SO-' + row.fk_stock_out_id;
					return str;
				}
			},
			{
				"data": "date_added"
			},
			{
				"data": "firstname"
			},
			{
				"data": "fk_stock_out_id",
				"render": function (data, type, row, meta) {
					return `<a class='text-success btn-view-items' data-id="${row.fk_stock_out_id}" ><i class='fa fa-eye'></i></a>`;
				}
			},
		],
		"ajax": {
			"url": base_url + "stockout_discrepancy/get_stock_out_discrepancy",
			"type": "POST"
		},
		"columnDefs": [{
			"targets": [3],
			"orderable": false,
		}, ],
	});

	$(document).on("click", ".btn-view-items", function () {
		let so_id = $(this).data("id");

		alert(so_id)
	})

})
