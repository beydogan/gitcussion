class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :recirect_new_domain, if: -> { request.host == "gitcuss.com" } 

  def recirect_new_domain
  	redirect_to "http://gitcussion.com"
  end

end
