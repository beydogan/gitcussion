require 'rails_helper'

RSpec.describe "repos/show", :type => :view do
  before(:each) do
    @repo = assign(:repo, Repo.create!(
      :name => "Name",
      :fullname => "Fullname",
      :homepage => "Homepage",
      :stars => 1,
      :watchers => 2,
      :forks => 3,
      :html_url => "Html Url",
      :data => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Fullname/)
    expect(rendered).to match(/Homepage/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Html Url/)
    expect(rendered).to match(/MyText/)
  end
end
