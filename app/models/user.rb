class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reminders, dependent: :destroy
  has_many :medicines, through: :reminders

  validates :first_name, :last_name,
            :username, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
