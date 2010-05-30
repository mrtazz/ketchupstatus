$(document).ready(function()
{
  $("#registerbutton").click(register_office);



  function register_office()
  {
    var url = "/ketchup/"+$("#office").attr("value");
    var res = $.post(url, {}, show_info);
  }

  function show_info(data, textstatus)
  {
    alert(data);
  }


});
