class HomeController < ApplicationController

  layout "application_wide", only: [:index]

  def index
    @top_commented = Repo.top_commented
  end
end
