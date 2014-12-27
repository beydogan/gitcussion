class ReposController < ApplicationController
  before_action :set_repo, only: [:edit, :update, :destroy]

  def search
    @query = search_params[:query]
    @repos = SearchRepoService.new.call(@query)
  end

  # GET /repos
  # GET /repos.json
  def index
    @repos = Repo.all
  end

  # GET /repos/1
  # GET /repos/1.json
  def show
    @repo = Repo.includes(:comments).find_by(fullname: params[:id])#Search db
    if @repo.nil?   #get from api if not in db and save it
      @repo = GetRepoService.new.call(params[:id])
      @repo.readme = FetchRepoReadmeService.new.call(params[:id])
      @repo.save
    end

    @comment = @repo.comments.new
    respond_to do |format|
      if @repo[:status] == :error
        format.html { redirect_to root_path, notice: "Repo Not Found"}
      else
        format.html
      end
    end

  end

  # GET /repos/new
  def new
    @repo = Repo.new
  end

  # GET /repos/1/edit
  def edit
  end

  # POST /repos
  # POST /repos.json
  def create
    @repo = Repo.new(repo_params)

    respond_to do |format|
      if @repo.save
        format.html { redirect_to @repo, notice: 'Repo was successfully created.' }
        format.json { render :show, status: :created, location: @repo }
      else
        format.html { render :new }
        format.json { render json: @repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /repos/1
  # PATCH/PUT /repos/1.json
  def update
    respond_to do |format|
      if @repo.update(repo_params)
        format.html { redirect_to @repo, notice: 'Repo was successfully updated.' }
        format.json { render :show, status: :ok, location: @repo }
      else
        format.html { render :edit }
        format.json { render json: @repo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /repos/1
  # DELETE /repos/1.json
  def destroy
    @repo.destroy
    respond_to do |format|
      format.html { redirect_to repos_url, notice: 'Repo was successfully destroyed.' }
      format.json { head :no_content }
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
