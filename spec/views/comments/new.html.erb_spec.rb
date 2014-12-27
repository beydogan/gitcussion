require 'rails_helper'

RSpec.describe "comments/new", :type => :view do
  before(:each) do
    assign(:comment, Comment.new(
      :text => "MyText",
      :user => nil,
      :repo => nil,
      :status => 1
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "textarea#comment_text[name=?]", "comment[text]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "input#comment_repo_id[name=?]", "comment[repo_id]"

      assert_select "input#comment_status[name=?]", "comment[status]"
    end
  end
end
