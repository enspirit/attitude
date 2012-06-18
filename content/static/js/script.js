$(document).ready(function(){
  for (i in highlight) {
    $("#link-" + highlight[i]).addClass("highlight");
  }
});