class AddGithubIdToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :github_id, :string
  end
end
