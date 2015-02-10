require "rails_helper"

RSpec.describe CommentsController, :type => :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/r/ruby/ruby/comments").to route_to("comments#create", repo_id: "ruby/ruby")
    end

    it "routes to #destroy" do
      pending
      expect(:delete => "/r/ruby/ruby/comments/1").to route_to("comments#destroy", id: 1, repo_id: "ruby/ruby")
    end

  end
end
