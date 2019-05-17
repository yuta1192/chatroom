App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    $('#messages').append data['message']

  talk: (message) ->
    @perform 'talk', message: message

$(document).on 'keypress', '[data-behavior~=room_talker]', (event) ->
  if event.keyCode is 13
    App.room.talk event.target.value
    event.target.value = ''
    event.preventDefault()
