require 'rails_helper'

RSpec.describe Repo, :type => :model do
  it "has a valid conference factory" do
    repo = Fabricate(:repo)
    expect(repo).to be_valid
  end
end
