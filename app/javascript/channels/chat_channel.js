import consumer from "channels/consumer"


if ($('.connect-websocket').attr('value')) {
  consumer.subscriptions.create({channel: "ChatChannel", room_id: $('.room-id').val()}, {
    initialized() {
      console.log('initialized');
    },

    connected() {
      console.log('connected');
      // Called when the subscription is ready for use on the server
    },

    disconnected() {
      console.log('disconnected');
      // Called when the subscription has been terminated by the server
    },

    received(data) {
      let user_id = parseInt($('.current-user-id').val());
      let container = '', time = 'time-right', margin = 'mrl-50';

      if (data.mod_message.user_id !== user_id) {
        container = 'darker';
        time = 'time-left';
        margin = 'mrr-50';
      }

      $('.list-message').append(`
      <div class="container-message ${container} ${margin}">
        <p>${data.mod_message.content}</p>
        <span class="${time}">${data.mod_message.created_at}</span>
      </div>
      `);
    },

    send: function(message) {
      this.perform('send_message', { message: message });
    }
  });
}
