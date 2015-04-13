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


function getData(header){
  var error = false
  request = $.ajax({
    url: "api/v1/todos/todo/post",
    dataType: "json",
    headers: {"X-USER-ACCESS-TOKEN": header},
    async: false,
    success: function(response){
    },
    error: function(error){
      error = true
    }
  });
  if(error){
    return error;
  }
  else{
    return request.responseJSON
  }
}

function showData(data){
  var array = [];
  $.each(data, function(i) {
    array.push(data[i].name)
  });
  if(array.length > 0){
    swal("You have Some Posts Todo: ", array.join(", "));
  }
}

