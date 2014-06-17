class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :stars
      t.text :remark
      t.references :project, index: true

      t.timestamps
    end
  end
end
