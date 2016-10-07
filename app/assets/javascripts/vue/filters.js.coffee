Vue.filter 'moment', (date) ->
  moment(date).format('DD MMMM YYYY')

Vue.filter 'capitalize', (value) -> 
  if (!value)
    return
  value = value.toString()
  value.charAt(0).toUpperCase() + value.slice(1)

Vue.filter 'displayDecimals', (value) ->
  if (!value)
    return
  value = value.toFixed(2)