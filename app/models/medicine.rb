class Medicine < ApplicationRecord
  has_many  :reminders

  validates :dose, :name, presence: true
end
