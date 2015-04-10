$(document).ready(function()
{
  $("#toggleToken").click(function()
  {
    if($("#toggleToken").text() == "Show Token"){
      $("#toggleToken").text("Hide Token")
    }
    else{
      $("#toggleToken").text("Show Token")
    }
    $("#token").toggle();
  });
});
