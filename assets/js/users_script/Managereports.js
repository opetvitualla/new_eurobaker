$(document).ready(function () {
  var base_url = $('.base_url').val();
  var stock_transfer_reports = $('#stock_transfer_reports').DataTable();
  var current_date = moment().format('YYYY-MM-DD HH:mm:ss');

  getPendingReports(current_date, current_date);
  getTransferReports(current_date, current_date);
  getEndingInventory(current_date);

  function getPendingReports(start, end) {
    var date_start = moment(start, 'YYYY-MM-DD').format('YYYY-MM-DD HH:mm:ss');
    var date_end = moment(end, 'YYYY-MM-DD').format('YYYY-MM-DD HH:mm:ss');
    $('#pending_reports').DataTable({
      "language": { "infoFiltered": "" },
      "destroy": true,
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
        {
          "data": "PK_stock_transfer_id", "render": function (data, type, row, meta) {
            var str = 'Stock Transfer';
            return str;
          }
        },
        {
          "data": "date_added", "render": function (data, type, row, meta) {
            var str = moment(row.date_added, "YYYY-MM-DD HH:mm:ss").format("MM/DD/YYYY");
            return str;
          }
        },
      ],
      "ajax": {
        "url": base_url + "managereports/get_pending_deliveries",
        "type": "POST",
        "data": { date_start: date_start, date_end: date_end }
      },
    });
  }

  function getTransferReports(start, end) {
    var date_start = moment(start, 'YYYY-MM-DD').format('YYYY-MM-DD HH:mm:ss');
    var date_end = moment(end, 'YYYY-MM-DD').format('YYYY-MM-DD HH:mm:ss');
    $('#transfer_reports').DataTable({
      "language": { "infoFiltered": "" },
      "destroy": true,
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
        { "data": "outlet_name" },
        { "data": "stock_out" },
        {
          "data": "date_added", "render": function (data, type, row, meta) {
            var str = moment(row.date_added, "YYYY-MM-DD HH:mm:ss").format("MM/DD/YYYY");
            return str;
          }
        },
      ],
      "ajax": {
        "url": base_url + "managereports/get_transfer_reports",
        "type": "POST",
        "data": { date_start: date_start, date_end: date_end }
      },
    });
  }

  function getEndingInventory(date) {
    var ymonth = moment(date, 'YYYY-MM').format('YYYY-MM');

    $('#ending_inv_reports').DataTable({
      "language": { "infoFiltered": "" },
      "destroy": true,
      "processing": true, //Feature control the processing indicator.
      "serverSide": true, //Feature control DataTables' server-side processing mode.
      "responsive": true,
      "order": [[0, 'desc']], //Initial no order.
      "columns": [
        {
          "data": "raw.PK_raw_materials_id", "render": function (data, type, row, meta) {
            var str = 'IT-' + row.PK_raw_materials_id;
            return str;
          }
        },
        { "data": "material_name" },
        { "data": "beginning_inventory" },
        { "data": "quantity" },
        {
          "data": "date_added", "render": function (data, type, row, meta) {
            var str = moment(row.date_added, "YYYY-MM-DD HH:mm:ss").format("MM/DD/YYYY");
            return str;
          }
        },
      ],
      "ajax": {
        "url": base_url + "managereports/get_ending_inventory",
        "type": "POST",
        "data": { ymonth: ymonth }
      },
    });
  }

  $(function () {
    $('.pending_deliveries, .stock_transfer').daterangepicker({
      showWeekNumbers: true,
    }, function (start, end, label) {
      getPendingReports(start, end);
      getTransferReports(start, end);
      $('input[name="date_start"]').val(start.format('YYYY-MM-DD'));
      $('input[name="date_end"]').val(end.format('YYYY-MM-DD'));
      // console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
    });
  });

  $(function () {
    $('.date-picker').datepicker({
      startView: "months",
      minViewMode: "months",
      format: 'yyyy-mm',
    });
  });

  $('#startDate').on('change', function () {
    $('input[name="date"]').val($(this).val());
    getEndingInventory($(this).val());
  })


  $(".ssss").removeClass("active")
})
