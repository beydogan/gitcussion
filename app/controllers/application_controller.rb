class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :recirect_new_domain, if: -> { request.host == "www.gitcuss.com" } 

  def recirect_new_domain
  	redirect_to "http://www.gitcussion.com"
  end

  def after_sign_in_path_for(resource_or_scope)
    if request.env['omniauth.origin']
      request.env['omniauth.origin']
    end
  end

end
