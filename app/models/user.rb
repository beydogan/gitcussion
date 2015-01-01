class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:github]
  has_many :comments, dependent: :destroy

  def self.from_github(uid)
    User.where(uid: uid).first
  end

  # def avatar_url(size=150)
  #   gravatar_id = Digest::MD5::hexdigest(self.email).downcase
  #   "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
  # end
end
