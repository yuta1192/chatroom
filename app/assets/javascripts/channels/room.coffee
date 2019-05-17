App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert data['message']
    # Called when there's incoming data on the websocket for this channel

  talk: (message) ->
    @perform 'talk', message: message

$(document).on 'keypress', '[data-behavior~=room_talker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.talk event.target.value
    event.target.value = ''
    event.preventDefault()
