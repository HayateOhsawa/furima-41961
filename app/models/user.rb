class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i
  with_options presence: true do
    validates :nickname
    validates :password, length: { minimum: 6 }, format: { with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' }, if: lambda {
      password.present?
    }
    validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :first_kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角文字カタカナを使用してください' }
    validates :last_kana, format: { with: /\A[ァ-ヶ]+\z/, message: '全角文字カタカナを使用してください' }
    validates :birth_date
  end
end
