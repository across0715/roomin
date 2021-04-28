class Account < ApplicationRecord
  belongs_to :staff
  validates :user_quantity, presence: true
end
