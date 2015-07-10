require 'rails_helper'

RSpec.describe CommentsController, :type => :controller do

  before :all do
    @user = Fabricate(:user)
  end

  before :each do
    sign_in @user
    @repo = Fabricate(:repo)
  end


  # This should return the minimal set of attributes required to create a valid
  # Comment. As you add validations to Comment, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
        comment: Faker::Lorem.sentence
    }
  }

  let(:invalid_attributes) {
    {
        comment: ""
    }
  }


  describe "POST create" do
    describe "with valid params" do
      it "creates a new Comment" do
        expect {
          post :create, {format: :js, comment: valid_attributes, repo_id: @repo.fullname}
        }.to change(Comment, :count).by(1)
      end

      it "assigns a newly created comment as @comment" do
        post :create, {format: :js, :comment => valid_attributes, repo_id: @repo.fullname}
        expect(assigns(:comment)).to be_a(Comment)
        expect(assigns(:comment)).to be_persisted
      end

    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved comment as @comment" do
        post :create, {format: :js, :comment => invalid_attributes, repo_id: @repo.fullname}
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it "re-renders the 'new' template" do
        post :create, {format: :js, :comment => invalid_attributes, repo_id: @repo.fullname}
        expect(response).to render_template("comments/create")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested comment" do
      skip
      comment = Comment.create! valid_attributes
      expect {
        delete :destroy, {:id => comment.to_param}
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to the comments list" do
      skip
      comment = Comment.create! valid_attributes
      delete :destroy, {:id => comment.to_param}
      expect(response).to redirect_to(comments_url)
    end
  end

  describe "POST like" do
    it "changes the like status of the comment of the user" do
      skip
      post :like, {format: :js, :comment => valid_attributes, repo_id: @repo.fullname}
      (@user.likes? valid_attributes).should be_true
    end
  end
end
