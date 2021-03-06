$("#users").ready(function () {
  "use strict";
  $("#users_table_form")[0].action += '/';

  function monkey_patch_form(table_row) {
    var user_id = table_row.children[table_row.childElementCount - 1].textContent;
    $("#users_table_form")[0].action = $("#users_table_form")[0].action.slice(0, $("#users_table_form")[0].action.lastIndexOf('/')) + '/' + user_id;
  }

  function generate_form_in_table() {
    var wanted_nodes = $("#new_user :input:not([type=hidden]), :input[name=user\\[admin\\]]"),
      new_row = "<tr class='users_form_row'>",
      i;
    for (i = 0; i < wanted_nodes.length; i++) {
      new_row += "<td>";
      new_row += wanted_nodes[i].outerHTML;
      if (wanted_nodes[i].type === "hidden") {
        i++;
        new_row += wanted_nodes[i].outerHTML;
      }
      new_row += "</td>";
    }
    new_row += "<td><a href='#' class='cancel'>Cancel</a></td>";
    new_row += "<td></td></tr>";
    new_row = new_row.replace("Create", "Update");
    new_row = new_row.replace("Add", "Edit");

    return $.parseHTML(new_row);
  };

  function form_with_default_values(table_row) {
    // Fill in default values
    var form = generate_form_in_table(),
      i;
    for (i = 0; i < form[0].children.length - 3; i++) {
      var target = form[0].children[i].children[0];
      var source = table_row.children[i];
      // Handle checkboxes
      if (target.type === "hidden") {
        if (source.textContent === "true" || source.textContent === 'Admin') {
          form[0].children[i].children[1].checked = true;
        }
      } else {
        target.value = source.textContent;
      }
    }
    return form;
  }

  function reset_table() {
    $("#users > tbody > :hidden").show();
    $(".users_form_row").remove();
  }

  function bind_cancel_listener_to_form(form) {
    $(form).find('.cancel').click(function (event) {
      event.preventDefault();
      reset_table();
    });
  }

  function insert_form_fields_into_table(target) {
    var table_row = target.parentElement.parentElement;

    monkey_patch_form(table_row);

    var form = form_with_default_values(table_row);

    bind_cancel_listener_to_form(form);

    $(table_row).hide();
    $(table_row).after(form);
  }

  $(".users_edit_button").click(function (event) {
    event.preventDefault();
    reset_table();
    insert_form_fields_into_table(event.target);
  });

});
