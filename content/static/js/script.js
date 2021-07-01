$(function() {
  Galleria.loadTheme("/js/libs/galleria.classic.min.js");
  Galleria.configure({
    transition: 'fade'
    //imageCrop: true
  });
  for (i in highlight) {
    $(".link-" + highlight[i]).addClass("highlight");
  }
});

function setVoorstelligen(album) {
  var Flickr = new Galleria.Flickr();
  Flickr.setOptions({
    max: 100
  });
  Flickr.set(
    album,
    function (data) {
      $("#galleria").show();
      Galleria.run('#galleria', {
        dataSource: data
      });
    }
  );
}