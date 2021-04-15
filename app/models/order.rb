class Order < ApplicationRecord
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 5 }
  validates :status, presence: true

  belongs_to :product
  belongs_to :user
  belongs_to :instruct_staff, class_name: "Staff", optional: true
  belongs_to :instructed_staff, class_name: "Staff", optional: true

  enum status: {
    accept: 1,
    complete: 2,
    unavailable: 3,
  }
end
