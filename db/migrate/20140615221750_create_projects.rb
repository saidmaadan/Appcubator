class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :github_link
      t.string :web_url
      t.string :looking_for

      t.timestamps
    end
  end
end
