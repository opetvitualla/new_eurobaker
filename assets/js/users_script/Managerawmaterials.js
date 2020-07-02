$(document).ready(function () {
     var base_url = $('.base_url').val();
     let items = [];
     let all_units = [];
     axios.get(`${base_url}Global_api/get_units`).then(res => {
          all_units = res.data.data;
     })

     axios.get(`${base_url}Global_api/get_items`).then(res => {
          items = res.data.data;
     })


     $('select[name="related_item"]').select2();

     var table_raw_materials = $('#raw_Materials').DataTable({
          "language": { "infoFiltered": "" },
          "processing": true, //Feature control the processing indicator.
          "serverSide": true, //Feature control DataTables' server-side processing mode.
          "responsive": true,
          "order": [[0, 'desc']], //Initial no order.
          "columns": [
               {
                    "data": "PK_raw_materials_id", "render": function (data, type, row, meta) {
                         var str = 'RM-' + row.PK_raw_materials_id;
                         return str;
                    }
               },
               { "data": "category_name" },
               { "data": "material_name" },
               { "data": "unit" },
               // {"data": "PK_raw_materials_id","render":function(data, type, row, meta){
               //      var str = parseFloat(row.average_cost).toFixed(2);
               //      return str;
               //      }
               // },
               {
                    "data": "PK_raw_materials_id", "render": function (data, type, row, meta) {
                         var str = parseFloat(row.sales_price).toFixed(2);
                         return str;
                    }
               },
               {
                    "data": "PK_raw_materials_id", "render": function (data, type, row, meta) {
                         var str = '<div class="action-btn-div"><a href="javascript:;" id="edit_Details" data-id="' + row.PK_raw_materials_id + '"><i class="fa fa-edit"></i></a>';
                         str += '<a href="javascript:;" id="view_Details" class="text-success"  data-id="' + row.PK_raw_materials_id + '"><i class="fa fa-eye"></i></a></div>';
                         return str;
                    }
               },
          ],
          "ajax": {
               "url": base_url + "managerawmaterials/get_raw_materials",
               "type": "POST"
          },
          "columnDefs": [
               {
                    "targets": [5],
                    "orderable": false,
               },
          ],
     });
     $(document).on('click', '.add_new', function () {
          let html = '';
          let options = '<option value="" selected>Select here<option>';

          items.map(item => {
               options += `<option data-id="${item.PK_raw_materials_id}" value="${item.material_name}">${item.material_name}<option>`;
          });

          html += `<optgroup label="Select an item">
                ${options}
              </optgroup>`;

          $('select[name="related_item"]').append(html);
          $('.add_raw_material_modal').modal('show');
     });

     $('select[name="related_item"]').on('change', function () {
          var elm = $("option:selected", this);
          let item_id = elm.attr("data-id");

          let item = items.find(itm => itm.PK_raw_materials_id == item_id);
          $('#Raw_Material_Add input, #Raw_Material_Add select[name="category"]').prop('readonly', true)

          $('input[name="related_item_id"]').val(item.related_item_id);
          $('input[name="material_name"]').val(item.material_name);
          $('select[name="category"] option[value=' + item.FK_category_id + ']').attr('selected', 'selected');
          $('input[name="unit"]').val(item.unit);
          $('input[name="sales_price"]').val(item.sales_price);
          console.log(item);
     })

     $(document).on('submit', '#Raw_Material_Add', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);

          $.ajax({
               url: base_url + 'managerawmaterials/addRawMaterial',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    s_alert("Successfully Saved!", "success");
                    table_raw_materials.ajax.reload();
                    $('.add_raw_material_modal').modal('hide');
               }
          });
     });

     $(document).on('click', '#view_Details', function () {
          var id = $(this).data('id');
          $('.view_details_modal').modal('show');
          $('.view_details_modal input').prop('disabled', true);

          $.ajax({
               url: base_url + 'managerawmaterials/viewDetails',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    $('.view_details_modal input[name="material_name"]').val(data.material_name);
                    $('.view_details_modal input[name="category"]').val(data.category_name);
                    $('.view_details_modal input[name="unit"]').val(data.unit);
                    $('.view_details_modal input[name="average_cost"]').val(data.average_cost);
                    $('.view_details_modal input[name="sales_price"]').val(data.sales_price);
               }
          });
     });

     $(document).on('click', '#edit_Details', function () {
          var id = $(this).data('id');
          $('.edit_details_modal').modal('show');

          $.ajax({
               url: base_url + 'managerawmaterials/viewDetails',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    $('.edit_details_modal input[name="material_name"]').val(data.material_name);
                    $('.edit_details_modal select[name="category"]').val(data.FK_category_id).trigger('change');
                    $('.edit_details_modal input[name="unit"]').val(data.unit);
                    $('.edit_details_modal input[name="average_cost"]').val(data.average_cost);
                    $('.edit_details_modal input[name="sales_price"]').val(data.sales_price);
                    $('.edit_details_modal .edit_Button').attr('data-id', data.PK_raw_materials_id);
               }
          });
     });

     $(document).on('submit', '#Raw_Material_Edit', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);
          var dataid = $('.edit_details_modal .edit_Button').data('id');
          formData.append('id', dataid)

          $.ajax({
               url: base_url + 'managerawmaterials/updateDetails',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    s_alert("Successfully Saved!", "success");
                    table_raw_materials.ajax.reload();
                    $('.edit_details_modal').modal('hide');
               }
          });
     });

     var table_raw_materials_cat = $('#raw_Materials_Cat').DataTable({
          "language": { "infoFiltered": "" },
          "processing": true, //Feature control the processing indicator.
          "serverSide": true, //Feature control DataTables' server-side processing mode.
          "responsive": true,
          "order": [[0, 'desc']], //Initial no order.
          "columns": [
               {
                    "data": "PK_category_id", "render": function (data, type, row, meta) {
                         var str = 'CAT-' + row.PK_category_id;
                         return str;
                    }
               },
               { "data": "category_name" },
               { "data": "date_added" },
               {
                    "data": "PK_category_id", "render": function (data, type, row, meta) {
                         var str = '<div class="action-btn-div"><a href="javascript:;" id="edit_Category_Details" data-id="' + row.PK_category_id + '"><i class="fa fa-edit"></i></a>';
                         str += '<a href="javascript:;" id="view_Category_Details" class="text-success"  data-id="' + row.PK_category_id + '"><i class="fa fa-eye"></i></a></div>';
                         return str;
                    }
               },
          ],
          "ajax": {
               "url": base_url + "managerawmaterials/getCategories",
               "type": "POST"
          },
          "columnDefs": [
               {
                    "targets": [3],
                    "orderable": false,
               },
          ],
     });

     $(document).on('submit', '#Raw_Material_Cat_Add', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);

          $.ajax({
               url: base_url + 'managerawmaterials/addCategory',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    s_alert("Successfully Saved!", "success");
                    table_raw_materials_cat.ajax.reload();
                    $('.add_raw_material_cat_modal').modal('hide');
               }
          });
     });

     $(document).on('click', '#view_Category_Details', function () {
          var id = $(this).data('id');
          $('.view_category_details_modal').modal('show');
          $('.view_category_details_modal input').prop('disabled', true);

          $.ajax({
               url: base_url + 'managerawmaterials/viewCategoryDetails',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    $('.view_category_details_modal input[name="category_name"]').val(data.category_name);
               }
          });
     });

     $(document).on('click', '#edit_Category_Details', function () {
          var id = $(this).data('id');
          console.log(id);
          $('.edit_category_details_modal').modal('show');

          $.ajax({
               url: base_url + 'managerawmaterials/viewCategoryDetails',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    $('.edit_category_details_modal input[name="category_name"]').val(data.category_name);
                    $('.edit_category_details_modal .edit_Button').attr('data-id', data.PK_category_id);
               }
          });
     });

     $(document).on('submit', '#Raw_Material_Cat_Edit', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);
          var dataid = $('#Raw_Material_Cat_Edit .edit_Button').data('id');
          formData.append('id', dataid)

          $.ajax({
               url: base_url + 'managerawmaterials/updateCategoryDetails',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    s_alert("Successfully Saved!", "success");
                    table_raw_materials_cat.ajax.reload();
                    $('.edit_category_details_modal').modal('hide');
               }
          });
     });


     // units
     var unit_conversion_table = $('#unit_conversion_table').DataTable({
          "language": { "infoFiltered": "" },
          "processing": true, //Feature control the processing indicator.
          "serverSide": true, //Feature control DataTables' server-side processing mode.
          "responsive": true,
          "order": [[0, 'desc']], //Initial no order.
          "columns": [
               {
                    "data": "fk_item_id", "render": function (data, type, row, meta) {
                         var str = 'RM-' + row.fk_item_id;
                         return str;
                    }
               },
               { "data": "material_name" },
               { "data": "unit" },
               { "data": "total_items" },
               { "data": "date_updated" },
               {
                    "data": "pk_unit_con_id", "render": function (data, type, row, meta) {
                         var str = '<div class="action-btn-div">';
                         str += '<a href="javascript:;" class="text-primary btn-edit-unit"  data-id="' + row.pk_unit_con_id + '"><i class="fa fa-edit"></i></a></div>';
                         return str;
                    }
               },
          ],
          "ajax": {
               "url": base_url + "managerawmaterials/getunitconverted_table",
               "type": "POST"
          },
          "columnDefs": [
               {
                    "targets": [3],
                    "orderable": false,
               },
          ],
     });

     $(".show-add_unit-modal").click(function () {
          let item_option = "<option value=''>Please select</option>";
          items.map(item => {
               item_option += `<option value="${item.PK_raw_materials_id}">${item.material_name}</option>`;
          })

          $(".item_dropdown").html(item_option);
          $(".item_dropdown").select2();

          $(".add_unit_modal").modal();
     })

     $("#unit_conversion_table").DataTable();

     $(".btn-add-item-unit").click(function () {
          let item_id = $(".item_dropdown").val();

          if (item_id == undefined || item_id == "" || item_id == 0) {
               s_alert("Select an item first", "error")
               return;
          }

          let res = items.find(item => item.PK_raw_materials_id == item_id)

          let i_units = "<option value=''> - </option>";

          all_units.map(unit => {
               i_units += `<option value="${unit.pk_unit_id}">${unit.unit_name}</option>`
          })

          if (res != undefined) {
               let html = `
                   <tr>
                      <td><span>${res.material_name}</span></td>
                      <td>${res.unit}</td>
                      <td><input class="form-control uom_value" min="1" type="number"/></td>
                      <td>
                         <select class="form-control new_unit_select">
                              ${i_units}
                         </select>
                      </td>
                      <td><input class="form-control new_value" min="1" type="number"/></td>
                      <td>
                         <a href="javascript:;" class="text-danger remove-unit-row"><i class="fa fa-trash"></i></a>
                      </td>
                   </tr>
               `;
               $(".table-unit-body").append(html)
          }
     })


     $(".btn-edit-item-unit").click(function () {
          let item_id = $("#unit_item_id").val();

          if (item_id == undefined || item_id == "" || item_id == 0) {
               s_alert("Select an item first", "error")
               return;
          }

          let res = items.find(item => item.PK_raw_materials_id == item_id)

          let i_units = "<option value=''> - </option>";

          all_units.map(unit => {
               i_units += `<option value="${unit.pk_unit_id}">${unit.unit_name}</option>`
          })

          if (res != undefined) {
               let html = `
                   <tr>
                      <td><span>${res.material_name}</span></td>
                      <td>${res.unit}</td>
                      <td><input class="form-control uom_value" min="1" type="number"/></td>
                      <td>
                         <select class="form-control new_unit_select_edit">
                              ${i_units}
                         </select>
                      </td>
                      <td><input class="form-control new_value" min="1" type="number"/></td>
                      <td>
                         <a href="javascript:;" class="text-danger remove-unit-row"><i class="fa fa-trash"></i></a>
                      </td>
                   </tr>
               `;
               $(".table-unit-body-edit").append(html)
          }
     })

     $(document).on("click", ".btn-edit-unit", function () {
          let item_id = $(this).data("id");
          $("#unit_con_id").val(item_id);


          $(".table-unit-body-edit").html("")

          axios.get(`${base_url}managerawmaterials/get_unit_data/${item_id}`).then(res => {
               if (res.data.result) {
                    let data = res.data.data[0];

                    $(".unit_item_name").html(data.material_name)
                    $("#unit_item_id").val(data.fk_item_id);

                    data.items.map(item => {

                         let i_units = "<option value=''> - </option>";

                         all_units.map(unit => {
                              i_units += `<option ${(item.fk_new_unit_id == unit.pk_unit_id) ? "selected" : ""} value="${unit.pk_unit_id}">${unit.unit_name}</option>`
                         })

                         let html = `
                              <tr>
                                   <td><span>${data.material_name}</span></td>
                                   <td>${data.unit}</td>
                                   <td><input class="form-control uom_value" value="${item.uom_value}" min="1" type="number"/></td>
                                   <td>
                                        <select class="form-control new_unit_select_edit">
                                             ${i_units}
                                        </select>
                                   </td>
                                   <td><input class="form-control new_value" value="${item.new_unit_value}" min="1" type="number"/></td>
                                   <td>
                                        <a href="javascript:;" class="text-danger remove-unit-row"><i class="fa fa-trash"></i></a>
                                   </td>
                              </tr>
                              `;
                         $(".table-unit-body-edit").append(html)
                    })

               }
          })

          $(".edit_unit_modal").modal();


     })

     $(".item_dropdown").change(function () {
          let item_id = $(this).val();

          let res = items.find(item => item.PK_raw_materials_id == item_id)

          let i_units = "<option value=''> - </option>";

          all_units.map(unit => {
               i_units += `<option value="${unit.pk_unit_id}">${unit.unit_name}</option>`
          })

          if (res != undefined) {
               let html = `
                   <tr>
                      <td><span>${res.material_name}</span></td>
                      <td>${res.unit}</td>
                      <td><input class="form-control uom_value" min="1" required type="number"/></td>
                      <td>
                         <select class="form-control new_unit_select">
                              ${i_units}
                         </select>
                      </td>
                      <td><input class="form-control new_value" required min="1" type="number"/></td>
                      <td>
                         <a href="javascript:;" class="text-danger remove-unit-row"><i class="fa fa-trash"></i></a>
                      </td>
                   </tr>
               `;
               $(".table-unit-body").html(html)
          }

     })

     $(document).on("click", ".remove-unit-row", function () {
          $(this).closest("tr").remove();
     })

     $(document).on("change", ".new_unit_select", function (e) {
          let unit_val = $(this).val();

          let counts = 0;
          $(".table-unit-body tr").each(function () {
               let r_val = $(this).find(".new_unit_select").val();
               if (r_val == unit_val) {
                    counts += 1;
               }
          })

          if (counts > 1) {
               s_alert("Unit already exists", "error")
               $(this).val("")
          }
     })

     $(document).on("change", ".new_unit_select_edit", function (e) {
          let unit_val = $(this).val();

          let counts = 0;
          $(".table-unit-body-edit tr").each(function () {
               let r_val = $(this).find(".new_unit_select_edit").val();
               if (r_val == unit_val) {
                    counts += 1;
               }
          })

          if (counts > 1) {
               s_alert("Unit already exists", "error")
               $(this).val("")
          }
     })

     $("#unit_modal_form").submit(function (e) {
          e.preventDefault();
          let unit_items = [];
          let has_err = false;
          let idx = 0;
          $(".table-unit-body tr").each(function () {
               idx += 1;

               let uom_val = $(this).find(".uom_value").val();
               let new_unit_val = $(this).find(".new_value").val();
               let selected_unit = $(this).find(".new_unit_select").val();
               let item_id = $(".item_dropdown").val();


               if (uom_val == "" || uom_val == undefined) {
                    s_alert("Please add the required fields", "error")
                    has_err = true;
               } else if (new_unit_val == "" || new_unit_val == undefined) {
                    s_alert("Please add the required fields", "error")
                    has_err = true;
               } else if (new_unit_val == uom_val) {
                    s_alert("Values must not equal", "error")
                    has_err = true;
               } else if (selected_unit == "" || selected_unit == undefined) {
                    s_alert("Please add the required fields", "error")
                    has_err = true;
               }
               unit_items.push({
                    item_id: item_id,
                    uom_value: uom_val,
                    new_unit: selected_unit,
                    new_unit_value: new_unit_val,
               })

          })

          if (idx == 0) {
               s_alert("Please add at least 1 item!", "error")
               return;
          }

          if (!has_err) {


               confirm_alert("Are you sure to add these units?").then(res => {
                    let frmdata = new FormData();
                    frmdata.append("unit_items", JSON.stringify(unit_items));
                    axios.post(`${base_url}managerawmaterials/save_unit_conversion`, frmdata).then(res => {
                         if (res.data.result) {
                              s_alert("Saved successfully!", "success");
                              $(".add_unit_modal").modal("hide");
                              unit_conversion_table.ajax.reload();
                         }
                    })
               })
          }

     })

     $("#unit_modal_edit_form").submit(function (e) {
          e.preventDefault();
          let unit_items = [];
          let has_err = false;
          let idx = 0;
          $(".table-unit-body-edit tr").each(function () {
               idx += 1;

               let uom_val = $(this).find(".uom_value").val();
               let new_unit_val = $(this).find(".new_value").val();
               let selected_unit = $(this).find(".new_unit_select_edit ").val();
               let item_id = $(".item_dropdown").val();
               let unit_con_id = $("#unit_con_id").val();

               if (uom_val == "" || uom_val == undefined) {
                    s_alert("Please add the required fields", "error")
                    has_err = true;
               } else if (new_unit_val == "" || new_unit_val == undefined) {
                    s_alert("Please add the required fields", "error")
                    has_err = true;
               } else if (new_unit_val == uom_val) {
                    s_alert("Values must not equal", "error")
                    has_err = true;
               } else if (selected_unit == "" || selected_unit == undefined) {
                    s_alert("Please add the required fields", "error")
                    has_err = true;
               }
               unit_items.push({
                    unit_con_id: unit_con_id,
                    item_id: item_id,
                    uom_value: uom_val,
                    new_unit: selected_unit,
                    new_unit_value: new_unit_val,
               })

          })

          if (idx == 0) {
               s_alert("Please add at least 1 item!", "error")
               return;
          }

          if (!has_err) {


               confirm_alert("Are you sure to update these units?").then(res => {
                    let frmdata = new FormData();
                    frmdata.append("unit_items", JSON.stringify(unit_items));
                    axios.post(`${base_url}managerawmaterials/update_unit_conversion`, frmdata).then(res => {
                         if (res.data.result) {
                              s_alert("Updated successfully!", "success");
                              $(".edit_unit_modal").modal("hide");
                              unit_conversion_table.ajax.reload();
                         }
                    })
               })
          }

     })

     var table_raw_materials_unit = $('#raw_Materials_Unit').DataTable({
          "language": { "infoFiltered": "" },
          "processing": true, //Feature control the processing indicator.
          "serverSide": true, //Feature control DataTables' server-side processing mode.
          "responsive": true,
          "order": [[0, 'desc']], //Initial no order.
          "columns": [
               {
                    "data": "PK_unit_id", "render": function (data, type, row, meta) {
                         var str = 'UNIT-' + row.PK_unit_id;
                         return str;
                    }
               },
               { "data": "unit_name" },
               { "data": "date_added" },
               {
                    "data": "PK_category_id", "render": function (data, type, row, meta) {
                         var str = '<div class="action-btn-div"><a href="javascript:;" id="edit_Unit_Details" data-id="' + row.PK_unit_id + '"><i class="fa fa-edit"></i></a>';
                         str += '<a href="javascript:;" id="delete_unit" class="text-danger"  data-id="' + row.PK_unit_id + '"><i class="fa fa-trash"></i></a></div>';
                         return str;
                    }
               },
          ],
          "ajax": {
               "url": base_url + "managerawmaterials/get_units",
               "type": "POST"
          },
          "columnDefs": [
               {
                    "targets": [3],
                    "orderable": false,
               },
          ],
     });

     $(document).on('submit', '#Raw_Material_Unit_Add', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);

          $.ajax({
               url: base_url + 'managerawmaterials/add_unit',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    s_alert("Successfully Saved!", "success");
                    table_raw_materials_unit.ajax.reload();
                    $('.add_raw_material_unit_modal').modal('hide');
               }
          });
     });

     $(document).on('click', '#view_Unit_Details', function () {
          var id = $(this).data('id');
          $('.view_unit_details_modal').modal('show');
          $('.view_unit_details_modal input').prop('disabled', true);

          $.ajax({
               url: base_url + 'managerawmaterials/viewUnitDetails',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    $('.view_unit_details_modal input[name="unit_name"]').val(data.unit_name);
                    $('.view_unit_details_modal input[name="unit_abbr"]').val(data.unit_abbr);
               }
          });
     });

     $(document).on('click', '#edit_Unit_Details', function () {
          var id = $(this).data('id');
          $('.edit_unit_details_modal').modal('show');

          $.ajax({
               url: base_url + 'managerawmaterials/viewUnitDetails',
               type: "post",
               data: { "id": id },
               dataType: 'json',
               success: function (data) {
                    $('.edit_unit_details_modal input[name="unit_name"]').val(data.unit_name);
                    // $('.edit_unit_details_modal input[name="unit_abbr"]').val(data.unit_abbr);
                    $('.edit_unit_details_modal .edit_Button').attr('data-id', data.PK_unit_id);
               }
          });
     });

     $(document).on('click', '#delete_unit', function () {
          var id = $(this).data('id');
          var frmdata = {
               "id": id,
               "delete": true
          };
          confirm_alert("Are you sure you want to delete this unit?").then(confirm => {
               $.ajax({
                    url: base_url + 'managerawmaterials/update_unit_details',
                    type: "post",
                    data: { "id": id, "delete": true },
                    dataType: 'json',
                    success: function (data) {
                         s_alert("Successfully Saved!", "success");
                         table_raw_materials_unit.ajax.reload();
                    }
               });
          });

     });

     $(document).on('submit', '#Raw_Material_Unit_Edit', function (e) {
          e.preventDefault();
          var formData = new FormData($(this)[0]);
          var dataid = $('.edit_unit_details_modal .edit_Button').data('id');

          alert(dataid)

          formData.append('id', dataid)

          $.ajax({
               url: base_url + 'managerawmaterials/update_unit_details',
               data: formData,
               processData: false,
               contentType: false,
               cache: false,
               type: 'POST',
               success: function (data) {
                    s_alert("Successfully Saved!", "success");
                    table_raw_materials_unit.ajax.reload();
                    $('.edit_unit_details_modal').modal('hide');
               }
          });
     });

     var table_raw_materials_price_logs = $('#raw_Materials_Price_Logs').DataTable({
          "language": { "infoFiltered": "" },
          "processing": true, //Feature control the processing indicator.
          "serverSide": true, //Feature control DataTables' server-side processing mode.
          "responsive": true,
          "order": [[0, 'desc']], //Initial no order.
          "columns": [
               {
                    "data": "PK_log_id", "render": function (data, type, row, meta) {
                         var str = 'PR-' + row.PK_log_id;
                         return str;
                    }
               },
               { "data": "material_name" },
               { "data": "previous_price" },
               { "data": "current_price" },
               { "data": "date_added" },
          ],
          "ajax": {
               "url": base_url + "managerawmaterials/getPriceLogs",
               "type": "POST"
          },
     });

})

