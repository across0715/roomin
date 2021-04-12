class Product < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :category, presence: true

  enum category: {
    in_room: 1,
    in_bath: 2,
    at_counter: 3,
  }
end
