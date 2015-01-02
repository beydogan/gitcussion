class AddSoFieldsToRepos < ActiveRecord::Migration
  def change
    add_column :repos, :so_data, :text, default: ""
  end
end
