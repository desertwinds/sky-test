$(window).on 'resize', ->
  if $(window).width() > 480
    $('.pagination').removeClass 'pagination-sm'
  else
    $('.pagination').addClass 'pagination-sm'
  return