class AddFieldsFromTrends < ActiveRecord::Migration
  def change
    add_column :trends, :content, :text
  end
end
