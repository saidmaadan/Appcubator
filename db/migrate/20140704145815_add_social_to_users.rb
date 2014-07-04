class AddSocialToUsers < ActiveRecord::Migration
  def change
    add_column :users, :github, :string
    add_column :users, :twitter, :string
    add_column :users, :dribbble, :string
    add_column :users, :linkedin, :string
    add_column :users, :codeeval, :string
  end
end
