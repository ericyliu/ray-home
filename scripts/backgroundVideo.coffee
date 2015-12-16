class BackgroundVideo
  constructor: (@playButton, @videoModal) ->
    @playButton.on 'click', @toggleVideoModal
    @videoModal.find('.overlay').on 'click', @toggleVideoModal
    @videoModal.find('.video-container').on 'click', @toggleVideoModal
    @videoModal.find('.fa-close').on 'click', @toggleVideoModal

  toggleVideoModal: =>
    @videoModal.toggle()


$(document).ready -> new BackgroundVideo(
  $('.background-video .btn.video')
  $('.background-video .fullscreen-video')
)
