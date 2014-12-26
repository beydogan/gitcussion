require 'rails_helper'

RSpec.describe "repos/index", :type => :view do
  before(:each) do
    assign(:repos, [
      Repo.create!(
        :name => "Name",
        :fullname => "Fullname",
        :homepage => "Homepage",
        :stars => 1,
        :watchers => 2,
        :forks => 3,
        :html_url => "Html Url",
        :data => "MyText"
      ),
      Repo.create!(
        :name => "Name",
        :fullname => "Fullname",
        :homepage => "Homepage",
        :stars => 1,
        :watchers => 2,
        :forks => 3,
        :html_url => "Html Url",
        :data => "MyText"
      )
    ])
  end

  it "renders a list of repos" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Fullname".to_s, :count => 2
    assert_select "tr>td", :text => "Homepage".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Html Url".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
