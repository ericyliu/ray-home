class Nav
  constructor: (@toggle, @dropdown) ->
    @toggle.on 'click', @toggleDropdown

  toggleDropdown: =>
    if @dropdown.height() is 0 then @dropdown.css 'height', '260px'
    else @dropdown.css 'height', 0

$(document).ready -> new Nav $('.nav .fa-bars'), $('.nav .links-dropdown')
