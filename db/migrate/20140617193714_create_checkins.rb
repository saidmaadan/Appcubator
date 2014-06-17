class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :name
      t.string :email
      t.string :skills
      t.integer :experience
      t.string :position
      t.references :idea, index: true

      t.timestamps
    end
  end
end
