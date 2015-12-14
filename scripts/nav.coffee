class Nav
  constructor: (@buyButton, @toggle, @dropdown) ->
    @toggle.on 'click', @toggleDropdown
    $(document).on 'scroll', @toggleBuyButton

  toggleBuyButton: (e) =>
    module = $ '.background-video'
    threshold = module.position().top + module.outerHeight true
    if $(document).scrollTop() > threshold
      @buyButton.css
        'background-color': '#5BBEB9'
        'color': '#FFF'
    else
      @buyButton.css
        'background-color': '#FFF'
        'color': '#5BBEB9'

  toggleDropdown: =>
    if @dropdown.height() is 0 then @dropdown.css 'height', '260px'
    else @dropdown.css 'height', 0

$(document).ready -> new Nav $('.nav .buy'), $('.nav .fa-bars'), $('.nav .links-dropdown')
