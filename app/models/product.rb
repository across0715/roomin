class Product < ApplicationRecord
  mount_uploader :image, ImageUploader

  validates :available, inclusion: { in: [true, false] }
  validates :category, presence: true
  validates :name_en, presence: true
  validates :image, presence: true

  has_many :orders, dependent: :destroy

  def name
    self.send("name_#{I18n.locale}")
  end

  enum category: {
    room: 1,
    bath: 2,
    counter: 3,
  }
end
