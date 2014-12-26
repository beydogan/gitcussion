class CreateRepos < ActiveRecord::Migration
  def change
    create_table :repos do |t|
      t.string :name
      t.string :fullname
      t.string :homepage
      t.integer :stars
      t.integer :watchers
      t.integer :forks
      t.datetime :pushed_at
      t.string :html_url
      t.text :data

      t.timestamps
    end
  end
end
