class User < ApplicationRecord
  has_many :items
  has_many :orders
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  with_options presence: true do
    validates :nickname
    validates :password, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }, if: -> { password.present? }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :first_kana, format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字カタカナを使用してください' }
    validates :last_kana, format: { with: /\A[ァ-ヶー]+\z/, message: '全角文字カタカナを使用してください' }
    validates :birth_date
  end
end
