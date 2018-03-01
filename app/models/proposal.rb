class Proposal < ApplicationRecord
  belongs_to :user
  belongs_to :gig

  validates :content, presence: true

  before_create :set_status

  def set_status
    self.status = "pending"
  end
end
