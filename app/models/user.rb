class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar
  has_one :detail
  acts_as_followable
  acts_as_follower

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{8,20}+\z/i


  validates :name, presence: true
  validates :password, format: {with: VALID_PASSWORD_REGEX, message: "は半角英数字8~20文字内で数字・英字それぞれ1文字以上含む必要があります"}
end
