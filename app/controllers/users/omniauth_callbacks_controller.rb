class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def github
    auth_data = request.env["omniauth.auth"]
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_github(auth_data['uid'])

    if @user && @user.persisted?
      sign_in_and_redirect @user, :event => :authentication
    else
      @user = User.new(
          email: auth_data['info']['email'],
          password:  Devise.friendly_token[0,20],
          uid: auth_data['uid'],
          provider: "github"
      )

      sign_in_and_redirect @user, :event => :authentication
    end
  end
end