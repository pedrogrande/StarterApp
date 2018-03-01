class Message < ApplicationRecord
  validates :subject, :message, presence: true

  def self.inbox(user_id)
    where(receiver_id: user_id).reverse_chron_order
  end

  def self.sent_box(user_id)
    where(sender_id: user_id).reverse_chron_order
  end

end
