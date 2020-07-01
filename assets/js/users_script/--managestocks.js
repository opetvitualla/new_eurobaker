$(document).ready(function() {
  var stock_transfer = $('#stock_Transfer').DataTable();

  $(document).on('click', '.transfer_view_details', function() {
    $('.transfer_view_details_modal').modal('show')
  })
  $(document).on('click', '.stock_out_view_details', function() {
    $('.stock_out_view_details_modal').modal('show')
  })

  var stock_out = $('#stock_Out').DataTable();
})
