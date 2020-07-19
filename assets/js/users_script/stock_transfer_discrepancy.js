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
			"data": "fk_transfer_id",
			"render": function (data, type, row, meta) {
				var str = 'ST-' + row.fk_transfer_id;
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
				return `<a class='text-success btn-view-items' data-id="${row.fk_transfer_id}" ><i class='fa fa-eye'></i></a>`;
			}
		},
		],
		"ajax": {
			"url": base_url + "stock_transfer_discrepancy/get_discrepancy",
			"type": "POST"
		},
		"columnDefs": [{
			"targets": [3],
			"orderable": false,
		},],
	});

	$(document).on("click", ".btn-view-items", function () {
		let so_id = $(this).data("id");

		axios.get(`${base_url}stock_transfer_discrepancy/get_descripancy_items/${so_id}`).then(res => {

			if (res.data.result) {

				let data = res.data.data;
				let html = "";

				data.items.map(dta => {

					html += `
						<tr>
							<td>${dta.material_name}</td>
							<td>${dta.qty}</td>
							<td>${dta.received_qty}</td>
							<td>${dta.units}</td>
						</tr>
					`

				})

				$(".table-so-body-disc").html(html)
				$(".discrepancy_modal").modal()
				$(".txt_desc_note").html(data.st_disc_data[0].reason);
				$(".so_number").html("ST-" + data.st_disc_data[0].fk_transfer_id)
				// $(".so_approve_by").html(data.st_disc_data[0].app_data.firstname + " " + data.st_disc_data[0].app_data.lastname)
				$(".so_receive_by").html(data.receiver.firstname + " " + data.receiver.lastname)
			}
			else {
				alert("something wrong!")
			}
		})

	})

})
