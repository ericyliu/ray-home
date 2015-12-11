class UniversalRemote
  devices: [
    {label: 'Set Top Box', icon: 'assets/devices/STB.svg'}
    {label: 'TV', icon: 'assets/devices/TV.svg'}
    {label: 'Receiver', icon: 'assets/devices/Reciever.svg'}
    {label: 'Roku', icon: 'assets/devices/Roku.svg'}
    {label: 'Soundbar', icon: 'assets/devices/Soundbar.svg'}
    {label: 'DVD & BluRay', icon: 'assets/devices/DVD_BluRay.svg'}
    {label: 'Media Player', icon: 'assets/devices/Media_Player.svg'}
    {label: 'Apple TV', icon: 'assets/devices/AppleTV.svg'}
    {label: 'Xbox', icon: 'assets/devices/Xbox.svg'}
  ]

  constructor: (@devicesContainer, @carouselIndicator) ->
    @setup()
    @devicesContainer.on 'scroll', @onScroll

  setup: =>
    container = @devicesContainer.find '.scrollable'
    for device in @devices
      container.append "
        <div class='device'>
          <div class='image-container'><img src='#{device.icon}'></div>
          <div class='name'>#{device.label}</div>
        </div>
      "
      @carouselIndicator.append "<div class='dot'></div>"
    $(@carouselIndicator.find('.dot')[0]).addClass 'active'

  onScroll: =>
    deviceWidth = 320
    left = @devicesContainer.scrollLeft()
    index = Math.round(left/deviceWidth)
    @carouselIndicator.find('.dot').removeClass 'active'
    $(@carouselIndicator.find('.dot')[index]).addClass 'active'

$(document).ready -> new UniversalRemote(
  $('.universal-remote .devices')
  $('.universal-remote .carousel-indicator')
)
