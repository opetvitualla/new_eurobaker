$(document).ready(function () {
     var base_url = $('.base_url').val();

     var table_suppliers = $('#table_suppliers').DataTable({
          "language": { "infoFiltered": "" },
          "processing": true, //Feature control the processing indicator.
          "serverSide": true, //Feature control DataTables' server-side processing mode.
          "responsive": true,
          "order": [[0, 'desc']], //Initial no order.
          "columns": [
               {
                    "data": "PK_supplier_id", "render": function (data, type, row, meta) {
                         var str = 'S-' + row.PK_supplier_id;
                         return str;
                    }
               },
               { "data": "supplier_name" },
               { "data": "terms" },
               {
                    "data": "PK_supplier_id", "render": function (data, type, row, meta) {
                         var str = '<div class="mx-auto action-btn-div text-center"> <a href="javascript:;" id="edit_Supplier_Details" class="text-success" data-id="' + row.PK_supplier_id + '"><i class="fa fa-edit"></i></a>';
                         str += '<a href="javascript:;" id="view_Supplier_Details"  data-id="' + row.PK_supplier_id + '"><i class="fa fa-eye"></i></a></div>';
                         return str;
                    }
               },
          ],
          "ajax": {
               "url": base_url + "managesuppliers/get_suppliers",
               "type": "POST"
          },
          "columnDefs": [
               {
                    "targets": [3],
                    "orderable": false,
               },
          ],
     });

     $(document).on('submit', '#Supplier_Add', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);

          $.ajax({
               url: base_url + 'managesuppliers/add_supplier',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    table_suppliers.ajax.reload();
                    $('.add_supplier_modal').modal('hide');
               }
          });
     });

     $(document).on('click', '#view_Supplier_Details', function () {
          var id = $(this).data('id');
          $('.view_supplier_details_modal').modal('show');
          $('.view_supplier_details_modal input, .view_supplier_details_modal textarea').prop('disabled', true);

          $.ajax({
               url: base_url + 'managesuppliers/view_details',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    $('.view_supplier_details_modal input[name="supplier_name"]').val(data.supplier_name);
                    $('.view_supplier_details_modal input[name="address"]').val(data.address);
                    $('.view_supplier_details_modal input[name="terms"]').val(data.terms);
                    $('.view_supplier_details_modal textarea[name="products"]').val(data.products);
               }
          });
     });

     $(document).on('click', '#edit_Supplier_Details', function () {
          var id = $(this).data('id');
          $('.edit_supplier_details_modal').modal('show');

          $.ajax({
               url: base_url + 'managesuppliers/view_details',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    $('.edit_supplier_details_modal input[name="supplier_name"]').val(data.supplier_name);
                    $('.edit_supplier_details_modal input[name="address"]').val(data.address);
                    $('.edit_supplier_details_modal input[name="terms"]').val(data.terms);
                    $('.edit_supplier_details_modal textarea[name="products"]').val(data.products);
                    $('.edit_supplier_details_modal .edit_Button').attr('data-id', data.PK_supplier_id);
               }
          });
     });

     $(document).on('submit', '#Supplier_Edit', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);
          var dataid = $('.edit_supplier_details_modal .edit_Button').data('id');
          formData.append('id', dataid)

          $.ajax({
               url: base_url + 'managesuppliers/update_details',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    table_suppliers.ajax.reload();
                    $('.edit_supplier_details_modal').modal('hide');
               }
          });
     });
});
