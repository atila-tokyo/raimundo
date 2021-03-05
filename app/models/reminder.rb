class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :medicine, optional: true

  validates :title, presence: true
end
