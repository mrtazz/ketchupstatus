$(document).ready(function()
{
  $("#registerbutton").click(register_office);
  $("#updatebutton").click(update_status);


  function register_office()
  {
    var url = "/ketchup/"+$("#office").attr("value");
    var res = $.post(url, {}, show_info);
  }

  function update_status()
  {
    var url = window.location.pathname+"/"+$("#valueinput").attr("value");
    var res = $.post(url, {}, show_info);
  }

  function show_info(data, textstatus)
  {
    alert(data);
  }


});
