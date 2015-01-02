class CommentsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_repo

  # POST /comments
  # POST /comments.json
  def create
    @comment = @repo.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.js
      else
        format.js
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    if current_user == @comment.user
      @comment.destroy
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render text: "You are not authorized", status: :unauthorized }
      end
    end

  end

  private

    def set_repo
      @repo = Repo.find_by(fullname: params[:repo_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comment)
    end
end
