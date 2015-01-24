class RaterController < ApplicationController

  def create
    if user_signed_in?
      obj = params[:klass].classify.constantize.find(params[:id])
      obj.rate params[:score].to_f, current_user, params[:dimension]
      obj.reload
      render :json => {status: true, score: obj.score.to_f, id: obj.id}
    else
      render :json => false
    end
  end
end
