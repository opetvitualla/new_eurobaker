$(document).ready(function() {
  var base_url = $('.base_url').val();

  var table_outlets = $('#table_outlets').DataTable({
       "language": { "infoFiltered": "" },
       "processing": true, //Feature control the processing indicator.
       "serverSide": true, //Feature control DataTables' server-side processing mode.
       "responsive": true,
       "order": [[0,'desc']], //Initial no order.
       "columns":[
            {"data": "PK_branch_id","render":function(data, type, row, meta){
                 var str = 'O-'+row.PK_branch_id;
                 return str;
                 }
            },
            {"data":"outlet_name"},
            {"data":"PK_branch_id","render":function(data, type, row, meta){
                 var str = '<div class="text-center action-btn-div"> <a href="javascript:;" id="edit_Outlet_Details" class="fa fa-edit" data-id="'+row.PK_branch_id+'"></a>';
                 str += '<a href="javascript:;" id ="view_Outlet_Details" class="fa fa-eye text-success" data-id="'+row.PK_branch_id+'"></a></div>';
                 return str;
             }
            },
       ],
       "ajax": {
            "url": base_url+"manageOutlets/getOutlets",
            "type": "POST"
       },
       "columnDefs": [
            {
                 "targets": [2],
                 "orderable": false,
             },
        ],
  });

  $(document).on('submit','#Outlet_Add', function(e) {
       e.preventDefault();
       var formData = new FormData($(this)[0]);

       $.ajax({
            url         : base_url + 'manageOutlets/addOutlet',
            data        : formData,
            processData : false,
            contentType : false,
            cache       : false,
            type        : 'POST',
            success     : function(data){
                          table_outlets.ajax.reload();
                          $('.add_outlet_modal').modal('hide');
            }
       });
  });

  $(document).on('click', '#view_Outlet_Details', function() {
      var id = $(this).data('id');
      $('.view_outlet_details_modal').modal('show');
      $('.view_outlet_details_modal input').prop('disabled', true);

      $.ajax({
           url      :  base_url + 'manageOutlets/viewDetails',
           type     :  "post",
           data     :  {  "id"  : id  },
           dataType :  'json',
           success  :  function(data){
                        $('.view_outlet_details_modal input[name="outlet_name"]').val(data.outlet_name);
           }
      });
  });

  $(document).on('click', '#edit_Outlet_Details', function() {
      var id = $(this).data('id');
      $('.edit_outlet_details_modal').modal('show');

      $.ajax({
           url      :  base_url + 'manageOutlets/viewDetails',
           type     :  "post",
           data     :  {  "id"  : id  },
           dataType :  'json',
           success  :  function(data){
                        $('.edit_outlet_details_modal input[name="outlet_name"]').val(data.outlet_name);
                        $('.edit_outlet_details_modal .edit_Button').attr('data-id', data.PK_branch_id);
           }
      });
  });

  $(document).on('submit','#Outlet_Edit', function(e) {
       e.preventDefault();
       var formData = new FormData($(this)[0]);
       var dataid   = $('.edit_outlet_details_modal .edit_Button').data('id');
       formData.append('id', dataid)

       $.ajax({
            url         : base_url + 'manageOutlets/updateDetails',
            data        : formData,
            processData : false,
            contentType : false,
            cache       : false,
            type        : 'POST',
            success     : function(data){
                          table_outlets.ajax.reload();
                          $('.edit_outlet_details_modal').modal('hide');
            }
       });
  });
});
