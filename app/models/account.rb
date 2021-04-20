class Account < ApplicationRecord
  belongs_to :staff
  validates :user_password_quantity, presence: true
end
