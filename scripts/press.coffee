class Press
  reviews: [
      review: '
        "Ray founder David Skokna didn\'t set out to redesign the remote so much as to redesign our relationship with television."
      '
      icon: 'assets/Press_Wired_Optimized.png'
    ,
      review: '
        "Ray Wants To Change Your TV Experience, With a Touchscreen Remote Control"
      '
      icon: 'assets/Press_Recode_Optimized.png'
    ,
      review: '
        "It\'s a beautiful product, for sure, and one that (in a limited demo) seemed to make bouncing around different devices, apps, and services for content a lot easier than the previous generation of remotes."
      '
      icon: 'assets/Press_TechCrunch_Optimized.png'
    ,
      review: '
        "The Ray Super Remote want\'s to declutter your coffee table and become the central nervous system of all your home entertainment system"
      '
      icon: 'assets/Press_NYT_Optimized.png'
    ,
      review: '
        "The Ray Super Remote Is a Universal Remote for the Internet Generation"
      '
      icon: 'assets/Press_Adweek_Optimized.png'
  ]

  constructor: (@desktopReviewsContainer, @mobileReviewsContainer) ->
    @setupDesktop()
    @setupMobile()

  setupDesktop: =>
    container = @desktopReviewsContainer.find '.sources'
    for review, index in @reviews
      container.append "
        <div review-index='#{index}' class='source'>
          <img src='#{review.icon}'>
        </div>
      "
    $(container.find('.source')[0]).addClass 'active'

    container = @desktopReviewsContainer.find '.review'
    container.html @reviews[0].review

    container = @desktopReviewsContainer.find '.sources'
    container.find('.source').on 'click', @selectReview
    container.find('.source').on 'hover', @selectReview

  setupMobile: =>
    container = @mobileReviewsContainer.find '.scrollable'
    for review in @reviews
      container.append "
        <div class='review-container'>
          <div class='icon'><img src='#{review.icon}'></div>
          <div class='review'>#{review.review}</div>
        </div>
      "
      @mobileReviewsContainer.find('.carousel-indicator').append "
        <div class='dot'></div>
      "
    container.css 'width', "#{480 * @reviews.length}px"
    container = @mobileReviewsContainer.find '.carousel-indicator'
    $(container.find('.dot')[0]).addClass 'active'

    container = @mobileReviewsContainer.find '.scrollable-container'
    container.on 'scroll', @onScroll

  selectReview: (e) =>
    index = $(e.currentTarget).attr 'review-index'
    container = @desktopReviewsContainer.find '.sources'
    container.find('.source').removeClass 'active'
    $(container.find('.source')[index]).addClass 'active'
    @desktopReviewsContainer.find('.review').html @reviews[index].review

  onScroll: =>
    container = @mobileReviewsContainer.find '.scrollable-container'
    reviewWidth = 480
    left = container.scrollLeft()
    index = Math.round(left/reviewWidth)
    container = @mobileReviewsContainer.find '.carousel-indicator'
    container.find('.dot').removeClass 'active'
    $(container.find('.dot')[index]).addClass 'active'


$(document).ready -> new Press(
  $('.press .reviews.desktop')
  $('.press .reviews.mobile')
)
