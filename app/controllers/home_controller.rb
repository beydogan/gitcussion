class HomeController < ApplicationController

  layout "application_wide", only: [:index]

  def index
    @top_commented = Repo.
        select("repos.*, COUNT(repo_id) as comment_count").
        joins(:comments).
        group("repos.id").
        order("comment_count DESC").
        limit(10)

  end
end
