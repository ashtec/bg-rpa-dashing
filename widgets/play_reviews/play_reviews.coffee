class Dashing.PlayReviews extends Dashing.Widget
  
  ready: ->
    @onData(this)

  onData: (data) ->
    console.log data
    widget = $(@node)
    widget.fadeOut().css('background-color', @get('bgColor')).fadeIn()
    currentRatingStar = widget.find(".current-rating")
    currentRatingStar.css('width', 20 * @get('rating') + '%')

  @accessor 'reviewTitleFixedChars', -> 
  	originalReviewTitle = @get('reviewTitle')
  	if (originalReviewTitle.length > 20)
  		originalReviewTitle.substring(0,20) + '...'
  	else
  		originalReviewTitle

  @accessor 'reviewTextFixedChars', -> 
  	originalReviewText = @get('reviewText')
  	if (originalReviewText.length > 120)
  		originalReviewText.substring(0,120) + '...'
  	else
  		originalReviewText

  @accessor 'bgColor', ->
    if @get('rating') >= 4
      "#96bf48"
    else if @get('rating') >= 3
      "#ff9618"
    else if @get('rating') >= 0
      "#D26771"
    else 
      "#999999"

