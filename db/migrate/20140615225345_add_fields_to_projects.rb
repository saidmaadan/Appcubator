class AddFieldsToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :teams, :string
    add_column :projects, :target_amount, :decimal
    add_column :projects, :image_file, :string
  end
end
