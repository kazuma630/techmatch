class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  validates :message, presence: true
end
