class RemoveFieldsFromTrends < ActiveRecord::Migration
  def change
    remove_column :trends, :content, :string
  end
end
