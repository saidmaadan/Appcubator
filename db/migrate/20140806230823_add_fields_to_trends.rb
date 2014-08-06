class AddFieldsToTrends < ActiveRecord::Migration
  def change
    add_column :trends, :twitter_url, :string
  end
end
