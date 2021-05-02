App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the WebSocket for this channel
    $('.js-messages').append data['message']

  speak: (message) ->
    @perform 'speak', message: message

  $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return = send      
      App.room.speak event.target.value
      event.target.value = ""
      event.preventDefault()
      setTimeout (->
       $('.col-md-8').scrollTop ($('.col-md-8')[0].scrollHeight)+34
       return
      ), 250

  $(document).on "click", "#submitbutton", '[data-behavior~=room_speaker]', (event) ->      
      App.room.speak $('[data-behavior~=room_speaker]').val()
      $('[data-behavior~=room_speaker]').val ""
      event.preventDefault()
      setTimeout (->
       $('.col-md-8').scrollTop ($('.col-md-8')[0].scrollHeight)+34
       return
      ), 250
      



