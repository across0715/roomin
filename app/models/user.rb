class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable
  before_create :insert_activated_at

  #パスワード生成されてから有効期限は一ヶ月
  def insert_activated_at
    self.activated_at = Time.current + 1.month
  end

  def active_for_authentication?
    super && account_active?
  end

  def inactive_message
    account_active? ? super : :account_inactive
  end

  private

  def account_active?
    self.available && self.activated_at >= Time.current
  end
end