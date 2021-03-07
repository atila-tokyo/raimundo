class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  attr_accessor :login

  has_many :reminders, dependent: :destroy
  has_many :medicines, through: :reminders
  has_many :chatrooms, dependent: :destroy
  has_many :messages, through: :chatrooms

  has_one_attached :photo, dependent: :destroy

  validates :first_name, :last_name,
            :username, presence: true

  validates :username, uniqueness: true
  validates :username, uniqueness: { case_sensitive: false }

  # validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, multiline: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: %i[login]

  # def login
  #   # @login || self.username || self.email
  #   @login || username || email
  # end

  def profile_picture
    if photo.attached?
      photo.key
    else
      "default_profile.png"
    end
  end

  def full_name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def self.find_for_database_authentication(warden_condition)
    conditions = warden_condition.dup
    login = conditions.delete(:login)
    where(conditions).where(
      ["lower(username) = :value OR lower(email) = :value",
       { value: login.strip.downcase }]
    ).first
  end
end
