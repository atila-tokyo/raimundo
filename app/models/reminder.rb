class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :medicine, dependent: :destroy

  validates :content, presence: true
end
