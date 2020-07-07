class User < ApplicationRecord
  has_many :user_videos, dependent: :destroy
  has_many :videos, through: :user_videos

  validates :email, uniqueness: true, presence: true
  validates :password, presence: true
  validates :first_name, presence: true
  enum role: { default: 0, admin: 1 }
  has_secure_password

  def self.create_with_omniauth(auth)
    user = User.find_by(email: auth[:info][:email])
    user.github_token = auth[:credentials][:token]
    user.save!(validate: false)
  end
end
