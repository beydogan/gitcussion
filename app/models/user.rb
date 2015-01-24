class User < ActiveRecord::Base
  enum role: [:user, :admin]
  ratyrate_rater
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]
  has_many :comments, dependent: :destroy

  def self.from_github(uid)
    User.where(uid: uid).first
  end

end
