class CreateAccessories < ActiveRecord::Migration
  def change
    create_table :accessories do |t|
      t.integer :category
      t.string :species
      t.text :description
      t.string :name

      t.timestamps null: false
    end
  end
end
