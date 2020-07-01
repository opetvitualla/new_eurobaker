// $(document).ready(function() {
//   var item_inventory = $('#item_Inventory').DataTable();

//   $(document).on('click', '.view_details', function() {
//     $('.view_details_modal').modal('show')
//   })
//   $(document).on('click', '.edit_details', function() {
//     $('.edit_details_modal').modal('show')
//   })
// })


$(document).ready(function () {
  var base_url = $('.base_url').val();

  var purchaser_item_Inventory = $('#purchaser_item_Inventory').DataTable();
  var item_inventory = $('#item_Inventory').DataTable({
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
      { "data": "amount" },
      { "data": "beginning_inventory" },
      { "data": "quantity" },
      {
        "data": "PK_raw_materials_id", "render": function (data, type, row, meta) {
          var str = '';
          if (row.status == 0) {
            str = '<span class="out_of_stock"> Out of Stock</span>';
          } else if (row.status == 1) {
            str = '<span class="in_stock"> In Stock</span>';
          } else {
            str = '<span class="low_stock"> Low Stock</span>';
          }
          return str;
        }
      },
      {
        "data": "date_added", "render": function (data, type, row, meta) {
          var str = moment(row.date_added, "YYYY-MM-DD HH:mm:ss").format("MM/DD/YYYY");
          return str;
        }
      },
      {
        "data": "PK_inventory_id", "render": function (data, type, row, meta) {
          str = '<span id ="view_Details" class="fa fa-eye view_Details text-success" data-id="' + row.PK_inventory_id + '"></span>';
          return str;
        }
      },
    ],
    "ajax": {
      "url": base_url + "Manageiteminventory/getItemInventory",
      "type": "POST"
    },
    "columnDefs": [
      {
        "targets": [7],
        "orderable": false,
      },
    ],
  });

  $(document).on('click', '.view_Details', function () {
    var id = $(this).data('id');
    $('.view_details_modal').modal('show');

    $.ajax({
      url: base_url + 'Manageiteminventory/viewDetails',
      type: "post",
      data: { "id": id },
      dataType: 'json',
      success: function (data) {
        var status = '';
        if (data.status == 1) {
          status = 'In Stock'
        } else if (data.status == 0) {
          status = 'Out of Stock'
        } else {
          status = 'Critical Stock'
        }
        $('.view_details_modal p.name').html(data.material_name);
        $('.view_details_modal p.amount').html(data.amount);
        $('.view_details_modal p.beginning_inventory').html(data.beginning_inventory);
        $('.view_details_modal p.quantity').html(data.quantity);
        $('.view_details_modal p.status').html(status);
        $('.view_details_modal p.date_added').html(moment(data.date_added, "YYYY-MM-DD HH:mm:ss").format("MM/DD/YYYY"));
        $('.view_details_modal p.date_modified').html(moment(data.date_updated, "YYYY-MM-DD HH:mm:ss").format("MM/DD/YYYY"));
      }
    });
  })
  $(document).on('click', '.edit_details', function () {
    $('.edit_details_modal').modal('show')
  })
})
