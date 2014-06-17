class AddFieldsToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :comment, :text
  end
end
