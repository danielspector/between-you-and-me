$ ->
  # enable chosen js
  $('.chosen-select').chosen
    width: '100%'

  $(".chosen-select").on "change", (e, params) ->
    $("#find_point_button").submit()
