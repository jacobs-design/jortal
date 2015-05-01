$(document).ready(function() {
  var projectId = false;
  $("#project-select").change(function() {
    projectId = $(this).val();
    $("#submit-project-form").attr("action", "/projects/" + projectId + "/submissions");
    $.get(projectId, function(data) {
        $("textarea#submission_desc").val(data.desc);
      } , "json");
  });
  $("#submit-project-form").submit(function(e){
    if (!projectId) {
      if ($("h4.error_msg").length == 0) {
        $('div.form-group').first().before("<h4 class='error_msg'>Select a Project!</h4>");
      }
      e.preventDefault();
      return false;
    } else {
      return true;
    }
  });
  $("#submission_attachment").change(function() {
    $("#submission_filename").val($(this).val().replace('C:\\fakepath\\', ''))
  });
});
