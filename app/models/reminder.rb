class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :medicine, dependent: :destroy, optional: true

  validates :title, presence: true
end
