class HomeController < ApplicationController

  layout "application_wide", only: [:index]

  def index
    x = repo_path("kod/hds")
  end
end
