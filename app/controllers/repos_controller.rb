class ReposController < ApplicationController
  before_action :set_repo, only: [:edit, :update, :destroy]

  def search
    @query = search_params[:query]
    @repos = SearchRepoService.new.call(@query)[:payload]
  end

  # GET /repos/1
  # GET /repos/1.json
  def show
    repo_service = FindRepoService.new.call(params[:id])
    if repo_service[:status] != :error
      @repo = repo_service[:payload]
      @comment = Comment.new
    end

    respond_to do |format|
      if repo_service[:status] == :error
        format.html { redirect_to root_path, notice: repo_service[:message]}
      else
        format.html
      end
    end

  end

  private

    def search_params
      params.permit(:query)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_repo
      @repo = Repo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def repo_params
      params.require(:repo).permit(:name, :fullname, :homepage, :stars, :watchers, :forks, :pushed_at, :html_url, :data)
    end
end
