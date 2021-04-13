class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :available, inclusion: { in: [true, false] }
  validates :category, presence: true
  validates :name, presence: true
  validates :image, presence: true

  has_many :orders, dependent: :destroy

  enum category: {
    in_room: 1,
    in_bath: 2,
    at_counter: 3,
  }
end
