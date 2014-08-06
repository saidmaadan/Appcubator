class CreateTrends < ActiveRecord::Migration
  def change
    create_table :trends do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.string :source_url
      t.attachment :upload

      t.timestamps
    end
  end
end
