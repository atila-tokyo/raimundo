class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :medicine, dependent: :destroy, optional: true

  validates :content, :title, presence: true

end
