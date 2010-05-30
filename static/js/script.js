$(document).ready(function()
{
  $("#registerbutton").click(register_office);



  function register_office()
  {
    var url = "/offices/"+$("#office").attr("value");
    var res = $.post(url, {}, show_info);
  }

  function show_info(data, textstatus)
  {
    alert("Foo bar bla!" + data);
  }


});
