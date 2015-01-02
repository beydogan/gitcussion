class AddCommentToComments < ActiveRecord::Migration
  def change
    rename_column :comments, :text, :comment
  end
end
