class Gallery
  gallery: [
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_01.jpg'
    ,
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_02.jpg'
    ,
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_03.jpg'
    ,
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_04.jpg'
    ,
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_05.jpg'
    ,
      type: 'image'
      source: 'https://cdn.ray.co/assets/images/Gallery_06.jpg'
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
          <div class='gallery-item image-item'>
            <img src='#{item.profilePic}'>
            <div class='username'>#{item.username}</div>
            <div class='quote'>#{item.quote}</div>
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
