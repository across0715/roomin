class Staff < ApplicationRecord
  validates :display, inclusion: { in: [true, false] }
  validates :name, presence: true, uniqueness: true
  has_many :accounts

  has_many :instruct_orders, class_name: "Order",
                             foreign_key: "instruct_staff_id",
                             dependent: :destroy

  has_many :instructed_orders, class_name: "Order",
                               foreign_key: "instructed_staff_id",
                               dependent: :destroy
end
