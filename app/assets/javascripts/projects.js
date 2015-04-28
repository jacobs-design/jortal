$(document).ready(function() {
  $("#project-select").change(function() {
    var projectId = $(this).val();
    $("#submit-project-form").attr("action", "/projects/" + projectId + "/submissions");
    $.get(projectId, function(data) {
        console.log(data.desc);
        $("textarea#submission_desc").val(data.desc);
      } , "json");
  });
});
