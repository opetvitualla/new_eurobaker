$(document).ready(function () {
    // var purchase_orders = $('#purchase_Orders').DataTable();
    var base_url = $('.base_url').val();

    var table_disc = $('#table_inventory').DataTable({
        "language": { "infoFiltered": "" },
        // "processing": true, //Feature control the processing indicator.
        // "serverSide": true, //Feature control DataTables' server-side processing mode.
        "responsive": true,
        "paging": false,
        "order": [[0, 'asc']], //Initial no order.
        "columns": [
            { "data": "material_name" },
            { "data": "category_name" },
            {
                "data": "material_name", "render": function (data, type, row, meta) {
                    return row.inv_data.beg_env
                }
            },
            {
                "data": "material_name", "render": function (data, type, row, meta) {
                    return (row.inv_data.tot_po != 0) ? "+" + row.inv_data.tot_po : "0"
                }
            },
            {
                "data": "material_name", "render": function (data, type, row, meta) {
                    return (row.inv_data.tot_tr_in != 0) ? "+" + row.inv_data.tot_tr_in : "0"
                }
            },
            {
                "data": "material_name", "render": function (data, type, row, meta) {
                    return (row.inv_data.tot_tr_out != 0) ? "-" + row.inv_data.tot_tr_out : "0"
                }
            },
            {
                "data": "material_name", "render": function (data, type, row, meta) {
                    return (row.inv_data.tot_so != 0) ? "-" + row.inv_data.tot_so : "0"
                }
            },
            { "data": "quantity" }
        ],
        "ajax": {
            "url": base_url + "inventory_movements/get_raw_materials",
            "type": "POST"
        },

    });

})
