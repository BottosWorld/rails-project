class User < ApplicationRecord
  has_one :portfolios
  has_many :stocks, through: :portfolios
  has_many :watchlists
  has_many :stocks, through: :watchlists
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, :omniauth_providers => [:github]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.nickname + "@email.com"
      user.password = Devise.friendly_token[0,20]
    end      
  end

end
