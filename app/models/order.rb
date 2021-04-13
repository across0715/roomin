class Order < ApplicationRecord
  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :status, presence: true

  belongs_to :product
  belongs_to :user
  belongs_to :instruct_staff, class_name: "Staff"
  belongs_to :instructed_staff, class_name: "Staff"

  enum status: {
    accept: 1,
    complete: 2,
    impossible: 3,
  }
end
