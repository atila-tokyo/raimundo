class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :medicine, dependent: :destroy

  validates :content, :title, presence: true

end
