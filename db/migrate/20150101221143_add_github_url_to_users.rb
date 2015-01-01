class AddGithubUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github_url, :string
  end
end
