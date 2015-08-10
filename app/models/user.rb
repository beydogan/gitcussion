class User < ActiveRecord::Base
  enum role: [:user, :admin]
  ratyrate_rater
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]
  has_many :comments, dependent: :destroy

  acts_as_voter

  def self.from_github(uid)
    User.where(uid: uid).first
  end

  def likes? comment
    self.voted_for? comment
  end
end
