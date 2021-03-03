class Reminder < ApplicationRecord
  belongs_to :user
  belongs_to :medicine, dependent: :destroy

  OPTIONS = ["Evento", "Medicamento"]

  validates :content, :title, presence: true

end
