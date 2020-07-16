$(document).ready(function () {
  var base_url = $('.base_url').val();

  let items = [];

  let is_add_item = false;

  $(".show-add-modal").click(function () {
    $(".table-po-body").html("");
    is_add_item = true;
    $(".total-item").html(0)

  })

  axios.get(`${base_url}global_api/get_items`).then(res => {
    //  suppliers = JSON.parse(res.data.data);
    items = res.data.data;
  })
  var stock_adjustments = $('#stock_Adjustments').DataTable({
    "language": { "infoFiltered": "" },
    "processing": true, //Feature control the processing indicator.
    "serverSide": true, //Feature control DataTables' server-side processing mode.
    "responsive": true,
    "order": [[0, 'desc']], //Initial no order.
    "columns": [
      {
        "data": "PK_inventory_id", "render": function (data, type, row, meta) {
          var str = 'IT-' + row.PK_inventory_id;
          return str;
        }
      },
      { "data": "material_name" },
      { "data": "expected_quantity" },
      { "data": "quantity" },
      {
        "data": "date_added", "render": function (data, type, row, meta) {
          var str = moment(row.date_added, "YYYY-MM-DD HH:mm:ss").format("MM/DD/YYYY");
          return str;
        }
      },
      {
        "data": "PK_inventory_id", "render": function (data, type, row, meta) {
          str = '<span id ="view_Details" class="fa fa-eye discrepancy_view_Details text-success" data-id="' + row.PK_inventory_id + '"></span>';
          return str;
        }
      },
    ],
    "ajax": {
      "url": base_url + "managestocks/get_stock_discrepancy",
      "type": "POST"
    },
    "columnDefs": [
      {
        "targets": [5],
        "orderable": false,
      },
    ],
  });
  var stock_transfer = $('#stock_Transfer').DataTable({
    "language": { "infoFiltered": "" },
    "processing": true, //Feature control the processing indicator.
    "serverSide": true, //Feature control DataTables' server-side processing mode.
    "responsive": true,
    "order": [[0, 'desc']], //Initial no order.
    "columns": [
      {
        "data": "PK_stock_transfer_id", "render": function (data, type, row, meta) {
          var str = 'TR-' + row.PK_stock_transfer_id;
          return str;
        }
      },
      { "data": "stock_out" },
      { "data": "outlet_name" },
      {
        "data": "PK_stock_transfer_id", "render": function (data, type, row, meta) {
          var str = '';
          if (row.status == 0) {
            str = '<span class="pending"> Pending</span>';
          } else {
            str = '<span class="delivered"> Delivered</span>';
          }
          return str;
        }
      },
      {
        "data": "PK_stock_transfer_id", "render": function (data, type, row, meta) {
          var str = moment(row.date_added, "YYYY-MM-DD HH:mm:ss").format("MM/DD/YYYY");
          return str;
        }
      },
      {
        "data": "PK_stock_transfer_id", "render": function (data, type, row, meta) {
          var str = '';
          if (row.status == 0) {
            // str += '<div class="mx-auto action-btn-div"><a id ="transfer_edit_details" class="fa fa-edit transfer_edit_details text-success" data-id="' + row.PK_stock_transfer_id + '"></a>';
            str += '<a id ="transfer_view_details" title="Mark as Delivered" class="fa fa-check received_details text-success" data-id="' + row.PK_stock_transfer_id + '"></a></div>';
          } else {
            str += '<a id ="transfer_view_details" class="fa fa-eye transfer_view_details text-success" data-id="' + row.PK_stock_transfer_id + '"></a>';
          }
          return str;
        }
      },
    ],
    "ajax": {
      "url": base_url + "managestocks/get_stock_transfer",
      "type": "POST"
    },
    "columnDefs": [
      {
        "targets": [5],
        "orderable": false,
      },
    ],
  });

  $(document).on("click", ".transfer_edit_details", function () {
    let transferred_id = $(this).data("id");
    is_add_item = false;
    $(".transferred_id").val(transferred_id)
    axios.get(`${base_url}managestocks/get_transferred_details/${transferred_id}`).then(res => {
      console.log(res);
      if (res.data.result == "success") {
        let datas = res.data.data;
        $('input[name="str_no"]').val(datas[0].str_no);
        let po_items = datas[0].po_items
        $(".po-table.transfer").html("")
        // $('.strno').html()

        po_items.map(po_item => {

          let options = "<option  value=''>Please select an item<option>";

          items.map(item => {
            options += `<option ${po_item.FK_raw_material_id == item.PK_raw_materials_id ? 'selected' : ''} data-id="${item.PK_raw_materials_id}" value="${item.material_name}">${item.material_name}<option>`;
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
                <input type="text" value="${po_item.unit}"  class="form-control" name="" readonly>
              </td>
              <td>
                <a style="font-size:16px;" href="javascript:;" class="mx-auto fa fa-trash text-danger remove-po-item"></a>
              </td>

              </tr>
            `

          $(".po-table-edit.transfer").append(html);
          $(".itemselect").select2();
        })
        generateOverTotal()
      }
      $(".edit_stock_transfer_modal").modal()
    })
  })

  $(document).on('click', '.transfer_view_details', function () {
    let transferred_id = $(this).data("id");
    $('.transfer_view_details_modal input').prop('disabled', true);

    axios.get(`${base_url}managestocks/get_transferred_details/${transferred_id}`).then(res => {
      if (res.data.result == "success") {
        let result = res.data.data;
        get_po_data = res.data.data;
        console.log(result[0].received_by);
        // $(".transfer-view").html("")
        $('p.destination').html(result[0].destination);
        $('.transfer_view_details_modal input[name="received_by"]').val(result[0].received_by);
        $('.transfer_view_details_modal input[name="counterchecked_by"]').val(result[0].counterchecked_by);
        $('p.strno').html(result[0].str_no);
        // $(".po_received_date").html(result[0].date_received)

        let po_items = result[0].po_items

        let gtotal = 0;

        po_items.map(po_item => {
          gtotal += Number(po_item.quantity) * Number(po_item.average_cost);
          let html = `
              <tr>
                <td>
                  ${po_item.material_name}
                </td>

                <td>
                  ${po_item.quantity}
                </td>
                <td>
                  ${po_item.unit}
                </td>

              </tr>
            `
          $(".transfer-view").append(html);
        })
        $(".total-item-received").html(po_items.length)
        $(".over-total-received").html(gtotal)
      }
    })
    $('.transfer_view_details_modal').modal('show')
  })

  $(document).on("change", ".item-qty", function () {

    let qty = Number($(this).val())
    let row = $(this).closest('tr');
    let selected = row.find(".itemselect option:selected");
    let item_id = selected.attr("data-id")
    let item = items.find(itm => itm.PK_raw_materials_id == item_id);

    // let total 	= calculateTotal(item.sales_price, qty)

    row.find(".item-total").val(total)

    generateOverTotal();
  })

  $(".btn-add-item.transfer").click(function () {

    let options = "<option  value=''>Please select an item<option>";
    items.map(item => {
      options += `<option data-id="${item.PK_raw_materials_id}" value="${item.material_name}">${item.material_name}<option>`;
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
					<input type="number"  class="form-control item-qty" name="" min="1" value="1">
			</td>
			<td>
        <input type="text" value=""  class="form-control item-unit" name="" readonly>
			</td>
      <td>
				<input required type="text" class="form-control item-price">
			</td>
			<td>
				<a style="font-size:16px;" href="javascript:;" class="mx-auto fa fa-trash text-danger remove-po-item"></a>
			</td>

			</tr>
		`
    $(".po-table.transfer tbody").append(html);
    $(".itemselect").select2();
  })

  $(document).on("click", ".remove-po-item", function () {
    let row = $(this).closest('tr');
    row.remove();
    generateOverTotal();
  })

  $(document).on("change", ".itemselect", function () {

    var elm = $("option:selected", this);
    let item_id = elm.attr("data-id");

    let item = items.find(itm => itm.PK_raw_materials_id == item_id);

    let row = $(this).closest('tr');
    if (is_item_exist(item_id)) {
      s_alert("This item is already added!", "error")
      row.remove()
      return;
    }
    let qty = row.find(".item-qty").val()
    let total = calculateTotal(item.sales_price, qty)

    row.find(".item-unit").val(item.unit)
    row.find(".item-price").val(item.sales_price)
    row.find(".item-total").val(total)

    generateOverTotal();
  })

  $("#Stock_Transfer_Add").submit(function (e) {
    e.preventDefault();
    // let overTotal = $(".over-total").html();
    // let supplier_id = $(".supplier_select option:selected").val()
    //
    // if (Number(overTotal) == 0) {
    // 	s_alert("Please add atleast one item", "error")
    // 	return
    // }
    // else if (!validated_table()) {
    // 	s_alert("Please input the required items", "error")
    // 	return
    // }

    confirm_alert("Are you sure to transfer these items?").then(res => {
      var frmdata = new FormData($(this)[0]);

      let po_items = [];
      let total_items = $(".total-item").html();
      let over_total = $(".over-total").html();

      $("#Stock_Transfer_Add .po-table.transfer .table-po-body tr").each(function () {
        let row = $(this);
        let item_ids = row.find(".itemselect option:selected").attr("data-id")
        po_items.push({
          item_id: item_ids,
          quantity: row.find(".item-qty").val(),
          unit: row.find(".item-unit").val(),
          price: row.find(".item-price").val(),
        })
      })

      frmdata.append("over_total", over_total);
      frmdata.append("total_items", total_items);
      frmdata.append("po_items", JSON.stringify(po_items));

      axios.post(`${base_url}managestocks/save_stock_transfer`, frmdata).then(res => {
        console.log('res', res);
        if (res.data.result == "success") {
          s_alert("Successfully Saved!", "success");
          stock_transfer.ajax.reload();
          setTimeout(() => { $('.add_stock_transfer_modal').modal('hide'); }, 1000);
        }
      })
    })

  })

  // $("#Stock_Transfer_Edit").submit(function (e) {
  // 	e.preventDefault();
  // 	// let overTotal = $(".over-total").html();
  // 	// let supplier_id = $(".supplier_select option:selected").val()
  //   //
  // 	// if (Number(overTotal) == 0) {
  // 	// 	s_alert("Please add atleast one item", "error")
  // 	// 	return
  // 	// }
  // 	// else if (!validated_table()) {
  // 	// 	s_alert("Please input the required items", "error")
  // 	// 	return
  // 	// }
  //
  // 	confirm_alert("Are you sure to update these items?").then(res => {
  // 		var frmdata = new FormData($(this)[0]);
  //
  // 		let po_items = [];
  // 		let total_items = $(".total-item").html();
  // 		let over_total = $(".over-total").html();
  //
  // 		$("#Stock_Transfer_Edit .po-table.transfer .table-po-body tr").each(function () {
  // 			let row 		= $(this);
  // 			let item_ids 	= row.find(".itemselect option:selected").attr("data-id")
  // 			po_items.push({
  // 				item_id: item_ids,
  // 				quantity: row.find(".item-qty").val(),
  // 				unit: row.find(".item-unit").val(),
  // 			})
  // 		})
  //
  // 		frmdata.append("over_total", 	over_total);
  // 		frmdata.append("total_items", 	total_items);
  // 		frmdata.append("po_items",		JSON.stringify(po_items));
  //
  // 		axios.post(`${base_url}managestocks/save_stock_transfer`, frmdata).then(res => {
  //       console.log('res', res);
  // 			if (res.data.result == "success") {
  // 				s_alert("Successfully Saved!", "success");
  // 				stock_transfer.ajax.reload();
  // 				setTimeout(() => { $('.add_stock_transfer_modal').modal('hide'); }, 1000);
  // 			}
  // 		})
  // 	})
  //
  // })

  $(document).on("click", ".received_details", function () {
    let transferred_id = $(this).data("id");

    axios.get(`${base_url}managestocks/get_transferred_details/${transferred_id}`).then(res => {
      console.log(res);
      if (res.data.result == "success") {
        let result = res.data.data;
        get_po_data = res.data.data;
        $('p.destination').html(result[0].destination);
        $('input[name="str_no"]').val(result[0].str_no);
        $(".transfer-view > tbody").html(" ")
        // $(".po_received_date").html(result[0].date_received)

        let po_items = result[0].po_items

        let gtotal = 0;

        po_items.map(po_item => {
          gtotal += Number(po_item.quantity) * Number(po_item.average_cost);
          let html = `
              <tr>
                <td>
                  ${po_item.material_name}
                </td>

                <td>
                  ${po_item.quantity}
                </td>
                <td>
                  ${po_item.unit}
                </td>
                <td>
                  <input type="number" name="actual_quantity[]" value=""/>
                </td>

              </tr>
            `
          $(".transfer-review > tbody").append(html);
        })
        $(".total-item-received").html(po_items.length)
        $(".over-total-received").html(gtotal)
      }
    })
    $('.transfer_review_modal').modal('show');
    // confirm_alert("Are you sure to mark this as Delivered?").then(res => {
    //   let frmdata = new FormData();
    //   frmdata.append("transferred_id", transferred_id);
    //
    //   axios.post(`${base_url}managestocks/delivered_transfer`, frmdata).then(res => {
    //     if (res.data.result == "success") {
    //       s_alert("Delivered Successfully!", "success");
    //       stock_transfer.ajax.reload();
    //     }
    //   })
    //
    // })
    $(document).on('submit', '#transfer_review', function (e) {
      e.preventDefault();
      let actual_quantity = $('input[name="actual_quantity[]"]').val();
      let frmdata = new FormData($(this)[0]);
      confirm_alert("Are you sure to mark this as Delivered?").then(res => {
        frmdata.append("transferred_id", transferred_id);
        frmdata.append("actual_quantity", actual_quantity);
        // console.log(frmdata);
        // console.log('actual',actual_quantity);

        axios.post(`${base_url}managestocks/delivered_transfer`, frmdata).then(res => {
          if (res.data.result == "success") {
            s_alert("Delivered Successfully!", "success");
            stock_transfer.ajax.reload();
          }
        })

      })

    })
  })



  $(document).on('click', '.discrepancy_view_Details', function () {
    var id = $(this).data('id');
    $('.view_details_modal_adj').modal('show');

    $.ajax({
      url: base_url + 'managestocks/viewDetailsAdjustments',
      type: "post",
      data: { "id": id },
      dataType: 'json',
      success: function (data) {
        console.log('dataaa', data);
        var status = '';
        if (data.status == 1) {
          status = 'In Stock'
        } else if (data.status == 0) {
          status = 'Out of Stock'
        } else {
          status = 'Critical Stock'
        }
        $('.view_details_modal_adj p.name').html(data.material_name);
        $('.view_details_modal_adj p.amount').html(data.amount);
        $('.view_details_modal_adj p.beginning_inventory').html(data.beginning_inventory);
        $('.view_details_modal_adj p.expected_quantity').html(data.expected_quantity);
        $('.view_details_modal_adj p.quantity').html(data.quantity);
        $('.view_details_modal_adj p.type').html(data.type);
        $('.view_details_modal_adj p.status').html(status);
        $('.view_details_modal_adj p.date_added').html(moment(data.date_added, "YYYY-MM-DD HH:mm:ss").format("MM/DD/YYYY"));
      }
    });
  });

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

  function validated_table() {
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
    let qty = 0;
    let count = 0;
    let countqty = 0;
    let mod = "add_stock_transfer_modal";
    if (!is_add_item) {
      mod = "edit_stock_transfer_modal";
    }
    $(".item-total").each(function (e) {
      over_total += Number($(this).val());
      count++;
    })
    $("." + mod + " .item-qty").each(function (e) {
      qty += Number($(this).val());
      countqty++;
    })

    $(".total-item").html(qty)
    $(".over-total").html(over_total.toFixed(2))
  }
})
