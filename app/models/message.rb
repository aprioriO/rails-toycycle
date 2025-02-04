class Message < ApplicationRecord
  belongs_to :trade
  belongs_to :user

  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_append_to "trade_#{trade.id}_messages",
                        partial: "messages/message",
                        locals: { message: self, user: user },
                        target: "messages"
  end
end
