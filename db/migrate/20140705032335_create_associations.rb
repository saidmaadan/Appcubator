class CreateAssociations < ActiveRecord::Migration
  def change
    create_table :associations do |t|
      t.references :user, index: true
      t.references :ability, index: true

      t.timestamps
    end
  end
end
