class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable,
         authentication_keys: [:email]

  #AdminUserモデルにメソッドを用意していて，AdminUserのインスタンスを渡す。

  def self.guest
    find_or_create_by!(email: "guest@example.com") do |user|
      AdminUser.password = SecureRandom.urlsafe_base64
    end
  end
end
