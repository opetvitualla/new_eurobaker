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
            { "data": "material_name" },
            { "data": "material_name" },
            { "data": "material_name" },
            { "data": "material_name" },
            { "data": "material_name" }
        ],
        "ajax": {
            "url": base_url + "inventory_movements/get_raw_materials",
            "type": "POST"
        },

    });

})

