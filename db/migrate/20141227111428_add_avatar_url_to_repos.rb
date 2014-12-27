class AddAvatarUrlToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :avatar_url, :string
  end
end
