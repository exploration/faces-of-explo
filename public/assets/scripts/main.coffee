# main scripts for the page go here.

showImages = () ->
  #we'll be scrolling to the box elements as they show up 
  setTimeout("$.smoothScroll({ scrollTarget: $('#box-3') });", 2100)
  setTimeout("$.smoothScroll({ scrollTarget: $('#box-2') });", 4100)
  setTimeout("$.smoothScroll({ scrollTarget: $('#box-1') });", 6100)
  setTimeout("$.smoothScroll({ scrollTarget: $('#box-full') });", 8100)

  #scroll to the first
  $('#box-4').fadeIn(1000)
  $.smoothScroll { scrollTarget: $('#box-4') }

  #set up timers for showing the box rows
  $('#box-3').delay(2000).fadeIn(1000)
  $('#box-2').delay(4000).fadeIn(1000)
  $('#box-1').delay(6000).fadeIn(1000)
  $('#box-full').delay(8000).fadeIn(1000)
  $('#explanation').delay(10000).fadeIn(1000)

#make it so clicking on "show me" activates the boxes
$(document).on "click", "#show-images", -> showImages()
