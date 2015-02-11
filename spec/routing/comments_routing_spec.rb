require "rails_helper"

RSpec.describe CommentsController, :type => :routing do
  describe "routing" do

    it "routes to #create" do
      expect(:post => "/r/ruby/ruby/comments").to route_to("comments#create", repo_id: "ruby/ruby")
    end

    it "routes to #destroy" do
      expect(:delete => "/r/ruby/ruby/comments/1").to route_to("comments#destroy", repo_id: "ruby/ruby", id: "1")
    end

  end
end
