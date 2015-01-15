class UserMailer < ActionMailer::Base

  def new_mention(user, comment)
    @user, @comment, @repo = user, comment, comment.repo
    mail from: "#{@user.username} <noreply@gitcussion.com>", to: @user.email, subject: "Re: [#{@repo.name}] on Gitcussion.com"
  end

end