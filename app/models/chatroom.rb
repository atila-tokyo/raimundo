class Chatroom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :guests
  has_many :users, through: :guests
end
