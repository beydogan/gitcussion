require "rails_helper"

RSpec.describe ReposController, :type => :routing do
  describe "routing" do
    it "routes to #show" do
      expect(:get => "/r/ruby/ruby").to route_to("repos#show", :id => "ruby/ruby")
    end
  end
end
