require 'rails_helper'

RSpec.describe HomeController, :type => :controller do

  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "returns top commented repos" do
      get :index
      @repos = [Fabricate(:repo),Fabricate(:repo),Fabricate(:repo)]
      @top_commented = Repo.top_commented
      expect(assigns(:top_commented)).to eq(@top_commented)
    end
  end

end
