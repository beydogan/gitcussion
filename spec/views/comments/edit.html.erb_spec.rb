require 'rails_helper'

RSpec.describe "comments/edit", :type => :view do
  before(:each) do
    @comment = assign(:comment, Comment.create!(
      :text => "MyText",
      :user => nil,
      :repo => nil,
      :status => 1
    ))
  end

  it "renders the edit comment form" do
    render

    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do

      assert_select "textarea#comment_text[name=?]", "comment[text]"

      assert_select "input#comment_user_id[name=?]", "comment[user_id]"

      assert_select "input#comment_repo_id[name=?]", "comment[repo_id]"

      assert_select "input#comment_status[name=?]", "comment[status]"
    end
  end
end
