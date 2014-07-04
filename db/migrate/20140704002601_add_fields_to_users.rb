class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :achievements, :text
    add_column :users, :powerpoint, :text
    add_column :users, :specialization, :string
    add_column :users, :location, :string
    add_column :users, :sex, :string
    add_column :users, :birthdate, :datetime
    add_column :users, :phone, :string
    add_column :users, :school, :text
    add_column :users, :work, :string
    add_column :users, :marital, :string
    add_column :users, :video, :string
  end
end
