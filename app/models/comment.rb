class Comment < ActiveRecord::Base
  validates :comment, length: { minimum: 5 }

  belongs_to :user
  belongs_to :repo

end
