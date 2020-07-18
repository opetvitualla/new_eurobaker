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
		"createdRow": function (row, data, dataIndex) { },
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
		},],
	});

	$(document).on("click", ".btn-view-items", function () {
		let so_id = $(this).data("id");

		axios.get(`${base_url}stockout_discrepancy/get_descripancy/${so_id}`).then(res => {

			if (res.data.result) {

				let data = res.data.data;
				let html = "";

				data.items.map(dta => {

					html += `
						<tr>
							<td>${dta.material_name}</td>
							<td>${dta.qty}</td>
							<td>${dta.received_qty}</td>
							<td>${dta.unit}</td>
						</tr>
					`

				})

				$(".table-so-body-disc").html(html)
				$(".discrepancy_modal").modal()
				$(".txt_desc_note").html(data.reason);
				$(".sd_segment").html(data.so_disc_data.so_data.segment_name)
				$(".so_number").html("SO-" + data.so_disc_data.so_data.PK_stock_out_id)
				$(".so_approve_by").html(data.so_disc_data.app_data.firstname + " " + data.so_disc_data.app_data.lastname)
				$(".so_req_by").html(data.so_disc_data.so_data.firstname + " " + data.so_disc_data.so_data.lastname)
			}
			else {
				alert("something wrong!")
			}
		})

	})

})
