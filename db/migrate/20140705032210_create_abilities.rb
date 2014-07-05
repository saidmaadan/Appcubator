class CreateAbilities < ActiveRecord::Migration
  def change
    create_table :abilities do |t|
      t.string :strenght

      t.timestamps
    end
  end
end
