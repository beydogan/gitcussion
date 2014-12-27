class AddReadmeToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :readme, :text, limit: 100
  end
end
