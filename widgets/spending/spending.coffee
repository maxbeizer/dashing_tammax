class Dashing.Spending extends Dashing.Widget
  @accessor 'total', Dashing.AnimatedValue


  @accessor 'total', ->
    parseFloat(@get('tamara')) + parseFloat(@get('max'))


  Dashing.Widget::accessor 'updatedAtMessage', ->
    if updatedAt = @get('updatedAt')
      timestamp = new Date(updatedAt * 1000)
      month = timestamp.getMonth()
      day = timestamp.getDate()
      hours = timestamp.getHours()
      minutes = ("0" + timestamp.getMinutes()).slice(-2)
      "Last updated #{month}/#{day} at #{hours}:#{minutes}"
