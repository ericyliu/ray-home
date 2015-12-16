class Gallery
  gallery: [
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_01.jpg'
    ,
      type: 'quote'
      profilePic: 'assets/gallery/Cohenheads_Optimized.png'
      username: '@COHENHEADS'
      quote: "\“Holy crap my new @RaySuperRemote is amazing! Setup was super easy. It's so slick though I do think a case might be handy.\”"
    ,
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_02.jpg'
    ,
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_03.jpg'
    ,
      type: 'quote'
      profilePic: 'assets/gallery/Drewg_Optimized.png'
      username: '@DREWG'
      quote: '@RaySuperRemote First impression last night, you began healing a lifetime of disappointment in universal remotes.'
    ,
      type: 'quote'
      profilePic: 'assets/gallery/Ericries_Optimized.png'
      username: '@ERICRIES'
      quote: 'Very impressed with @rayremote universal remote. Great out of the box experience.'
    ,
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_04.jpg'
    ,
      type: 'quote'
      profilePic: 'assets/gallery/Giordanobc_Optimized.png'
      username: '@GIORDANOBC'
      quote: 'This is magic. Turned it on, 5 mins set-up, now controls all my devices. No other hardware required. It just works'
    ,
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_05.jpg'
  ]

  constructor: (@galleryContainer, @loadMoreButton) ->
    @setup()
    @loadMoreButton.on 'click', @loadMore

  setup: =>
    for item in @gallery
      if item.type is 'image'
        html = "
          <div class='gallery-item image-item'>
            <img src='#{item.source}'>
          </div>
        "
      else
        item.type is 'quote'
        html = "
          <div class='gallery-item quote-item'>
            <img src='#{item.profilePic}'>
            <div class='username'>#{item.username}</div>
            <div class='quote'>#{item.quote}</div>
            <a class='link fa fa-twitter' href='https://twitter.com/#{item.username.split('@')[1]}'></a>
          </div>
        "
      @galleryContainer.append html

  loadMore: =>
    height = 1170
    @galleryContainer.css 'height', "#{height * 2}px"
    @loadMoreButton.css 'display', 'none'


$(document).ready -> new Gallery(
  $('.gallery-and-buzz .gallery-container')
  $('.gallery-and-buzz .btn')
)
