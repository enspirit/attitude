$(function() {
  Galleria.loadTheme("/js/libs/galleria.classic.min.js");
  Galleria.configure({
    transition: 'fade'
    //imageCrop: true
  });
  $(".voorstellingen-overview li").click(function() {
    var gallery = $(this).attr("data-album");
    var url = $(this).attr("data-url");
    var Flickr = new Galleria.Flickr();
    Flickr.setOptions({
      max: 100
    });
    Flickr.set(
      gallery,
      function (data) {
        $("#galleria").show();
        $(".intro").hide();
        $(".intro."+url).show();
        Galleria.run('#galleria', {
          dataSource: data
        });
      }
    );
  })
});
