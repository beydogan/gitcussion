require 'rails_helper'

RSpec.describe "repos/new", :type => :view do
  before(:each) do
    assign(:repo, Repo.new(
      :name => "MyString",
      :fullname => "MyString",
      :homepage => "MyString",
      :stars => 1,
      :watchers => 1,
      :forks => 1,
      :html_url => "MyString",
      :data => "MyText"
    ))
  end

  it "renders new repo form" do
    render

    assert_select "form[action=?][method=?]", repos_path, "post" do

      assert_select "input#repo_name[name=?]", "repo[name]"

      assert_select "input#repo_fullname[name=?]", "repo[fullname]"

      assert_select "input#repo_homepage[name=?]", "repo[homepage]"

      assert_select "input#repo_stars[name=?]", "repo[stars]"

      assert_select "input#repo_watchers[name=?]", "repo[watchers]"

      assert_select "input#repo_forks[name=?]", "repo[forks]"

      assert_select "input#repo_html_url[name=?]", "repo[html_url]"

      assert_select "textarea#repo_data[name=?]", "repo[data]"
    end
  end
end
