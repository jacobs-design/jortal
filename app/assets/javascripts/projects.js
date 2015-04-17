$(document).ready(function() {
  $("#project-select").change(function() {
    var projectId = $(this).val();
    $("#submit-project-form").attr("action", "/projects/" + projectId + "/submissions");
  });
});
