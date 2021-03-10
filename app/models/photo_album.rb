
class PhotoAlbum < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  validates :title, presence: true
end