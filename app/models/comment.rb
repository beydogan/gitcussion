class Comment < ActiveRecord::Base
  validates :comment, length: {minimum: 5}

  belongs_to :user
  belongs_to :repo

  after_commit :notify_mentions, :on => [:create, :update]

  def notify_mentions
    return true # Till mail & background job settings done
    User.where(username: Gitcussion::UsernameExtractor.parse(self.comment)).each do |user|
      UserMailer.new_mention(user, self).deliver
    end
  end

#   handle_asynchronously

end
