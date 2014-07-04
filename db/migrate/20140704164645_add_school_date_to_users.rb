class AddSchoolDateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :degree, :string
    add_column :users, :start_year, :string
    add_column :users, :grad_year, :string
  end
end
