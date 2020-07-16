$(document).ready(function () {
     var base_url = $('.base_url').val();

     var table_employees = $('#table_employees').DataTable({
          "language": { "infoFiltered": "" },
          "processing": true, //Feature control the processing indicator.
          "serverSide": true, //Feature control DataTables' server-side processing mode.
          "responsive": true,
          "order": [[0, 'desc']], //Initial no order.
          "columns": [
               {
                    "data": "FK_user_id", "render": function (data, type, row, meta) {
                         var str = 'EM-' + row.PK_user_id;
                         return str;
                    }
               },
               {
                    "data": "firstname", "render": function (data, type, row, meta) {
                         var str = row.firstname + ' ' + row.lastname;
                         return str;
                    }
               },
               { "data": "email_address" },
               { "data": "date_added" },
               {
                    "data": "PK_user_id", "render": function (data, type, row, meta) {
                         var str = '<div class="mx-auto action-btn-div text-center"> <a href="javascript:;" id="edit_Employee_Details" class="text-success" data-id="' + row.PK_user_id + '"><i class="fa fa-edit"></i></a>';
                         str += '<a href="javascript:;" id="view_Employee_Details"  data-id="' + row.PK_user_id + '"><i class="fa fa-eye"></i></a></div>';
                         return str;
                    }
               },
          ],
          "ajax": {
               "url": base_url + "manageemployees/get_employees",
               "type": "POST"
          },
          "columnDefs": [
               {
                    "targets": [4],
                    "orderable": false,
               },
          ],
     });

     $(document).on('submit', '#Employee_Add', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);

          $.ajax({
               url: base_url + 'manageemployees/add_employee',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    table_employees.ajax.reload();
                    $('.add_employee_modal').modal('hide');
               }
          });
     });

     $(document).on('click', '#view_Employee_Details', function () {
          var id = $(this).data('id');
          $('.view_employee_details_modal').modal('show');
          $('.view_employee_details_modal input, .view_employee_details_modal select').prop('disabled', true);

          $.ajax({
               url: base_url + 'manageemployees/view_details',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    console.log(data);
                    $('.view_employee_details_modal input[name="first_name"]').val(data.firstname);
                    $('.view_employee_details_modal input[name="last_name"]').val(data.lastname);
                    $('.view_employee_details_modal input[name="email_address"]').val(data.email_address);
                    $('.view_employee_details_modal input[name="age"]').val(data.age);
                    $('.view_employee_details_modal input[value=' + data.gender + ']').prop("checked", true);
                    $('.view_employee_details_modal input[name="username"]').val(data.username);
                    $('.view_employee_details_modal input[name="password"]').val(data.password);
                    $('.view_employee_details_modal select[name="outlet_id"] option[value=' + data.branch_assigned + ']').attr('selected', 'selected');
                    $('.view_employee_details_modal select[name="user_type"] option[value=' + data.user_type + ']').attr('selected', 'selected');
                    $('.view_employee_details_modal input[name="address"]').val(data.address);
               }
          });
     });

     $(document).on('click', '#edit_Employee_Details', function () {
          var id = $(this).data('id');
          $('.edit_employee_details_modal').modal('show');

          $.ajax({
               url: base_url + 'manageemployees/view_details',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    $('.edit_employee_details_modal input[name="user_id"]').val(data.PK_user_id);
                    $('.edit_employee_details_modal input[name="first_name"]').val(data.firstname);
                    $('.edit_employee_details_modal input[name="last_name"]').val(data.lastname);
                    $('.edit_employee_details_modal input[name="email_address"]').val(data.email_address);
                    $('.edit_employee_details_modal input[name="age"]').val(data.age);
                    $('.edit_employee_details_modal input[value=' + data.gender + ']').prop("checked", true);
                    $('.edit_employee_details_modal input[name="username"]').val(data.username);
                    $('.edit_employee_details_modal input[name="password"]').val(data.password);
                    $('.edit_employee_details_modal select[name="outlet_id"] option[value=' + data.branch_assigned + ']').attr('selected', 'selected');
                    $('.edit_employee_details_modal select[name="user_type"] option[value=' + data.user_type + ']').attr('selected', 'selected');
                    $('.edit_employee_details_modal input[name="address"]').val(data.address);
               }
          });
     });

     $(document).on('submit', '#Employee_Edit', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);

          $.ajax({
               url: base_url + 'manageemployees/update_details',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    table_employees.ajax.reload();
                    $('.edit_employee_details_modal').modal('hide');
               }
          });
     });
});
