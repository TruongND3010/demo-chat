class SendMessageJob < ApplicationJob
  queue_as :default

  def perform(room_id, message)
    ActionCable.server.broadcast "chatroom_channel_#{room_id}", { mod_message: message }
  end
end
