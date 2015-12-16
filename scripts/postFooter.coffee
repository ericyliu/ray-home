class postFooter
  threshold: 100

  constructor: (@container) ->
    $(document).on 'scrollend', 0, @onScroll

  onScroll: =>
    scroll = $(document).scrollTop() + $(window).height()
    top = @container.position().top
    if scroll > top && scroll < top + @threshold
      scrollHeight = top - $(window).height()
      $('html, body').animate {scrollTop: scrollHeight}, 300
    else if scroll >= top + @threshold && scroll < top + @container.height()/2
      $('html, body').animate {scrollTop: top}, 300


$(document).ready -> new postFooter $('.post-footer')
