class AddMoreFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avatar_url, :string
    add_column :users, :username, :string
  end
end
