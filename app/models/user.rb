class User < ApplicationRecord
  validates :used, inclusion: { in: [true, false] }
  validates :username, length: { is: 6 }
  validates :available, inclusion: { in: [true, false] }
  validates :activated_at, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, authentication_keys: [:username]
  before_validation :insert_activated_at, on: :create
  has_many :orders, dependent: :destroy

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

  def self.generate_list(quantity)
    base_id = User.maximum(:id)

    list = []
    quantity.times do |i|
      # 同じパスワードが作られないように id を利用して連番を作成
      id = base_id.to_s(16)
      # id は６桁とする
      count = 5 - id.size
      id << [*"g".."z"].shuffle[0..count].join if count >= 0
      # 残り４文字ランダムで追加
      salt = [*"a".."z", *0..9].shuffle[0..3].join
      list << { username: id, password: "#{id}#{salt}" }
    end
    list
  end
end
