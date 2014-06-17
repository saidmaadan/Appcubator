class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.string :goal
      t.string :category
      t.string :market

      t.timestamps
    end
  end
end
