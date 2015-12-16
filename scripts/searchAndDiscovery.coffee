class SearchAndDiscovery
  ratio: 3
  ratio2: 2

  constructor: (@container) ->
    @leftBlurb = @container.find '.left.blurb'
    @leftPhone = @container.find '.left.phone'
    @rightBlurb = @container.find '.right.blurb'
    @rightPhone = @container.find '.right.phone'
    $(document).on 'scroll', @onScroll

  onScroll: =>
    threshold = $(window).height()
    top = @container.position().top
    scroll = $(document).scrollTop()
    if scroll < top - threshold
      parallax = threshold / @ratio
      parallax2 = threshold / @ratio2
    else if scroll >= top - threshold && scroll < top
      parallax = (top - scroll) / @ratio
      parallax2 = (top - scroll) / @ratio2
    @leftBlurb.css 'margin-top', "-#{parallax}px"
    @leftPhone.css 'margin-top', "-#{parallax2}px"
    @rightBlurb.css 'margin-top', "#{parallax}px"
    @rightPhone.css 'margin-top', "#{parallax2}px"
    # else if scroll >= top
    #   @leftBlurb.css 'margin-top', '0'
    #   @rightBlurb.css 'margin-top', '0'
    #   @leftPhone.css 'margin-top', '0'
    #   @rightPhone.css 'margin-top', '0'


$(document).ready -> new SearchAndDiscovery $('.search-and-discovery')
