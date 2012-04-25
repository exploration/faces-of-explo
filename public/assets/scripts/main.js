(function() {
  var showImages;

  showImages = function() {
    setTimeout("$.smoothScroll({ scrollTarget: $('#box-3') });", 2100);
    setTimeout("$.smoothScroll({ scrollTarget: $('#box-2') });", 4100);
    setTimeout("$.smoothScroll({ scrollTarget: $('#box-1') });", 6100);
    setTimeout("$.smoothScroll({ scrollTarget: $('#box-full') });", 8100);
    $('#box-4').fadeIn(1000);
    $.smoothScroll({
      scrollTarget: $('#box-4')
    });
    $('#box-3').delay(2000).fadeIn(1000);
    $('#box-2').delay(4000).fadeIn(1000);
    $('#box-1').delay(6000).fadeIn(1000);
    $('#box-full').delay(8000).fadeIn(1000);
    return $('#explanation').delay(10000).fadeIn(1000);
  };

  $(document).on("click", "#show-images", function() {
    return showImages();
  });

}).call(this);
