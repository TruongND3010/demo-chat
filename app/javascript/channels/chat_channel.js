App.cable.subscriptions.create('ChatChanel', {
    connected: function() {
        console.log("Connected!");
    },
    disconnected: function() {
        console.log("Disconnected!");
    },
    received: function(data) {
        console.log(data);
    }
});