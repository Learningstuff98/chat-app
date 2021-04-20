class SendCommentJob < ApplicationJob
  queue_as :default

  def perform(chat_data)
    ActionCable.server.broadcast("chatroom_channel", comment: chat_data[:comment], chatroom: chat_data[:chatroom])
  end
end
