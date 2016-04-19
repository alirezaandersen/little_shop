class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :species
      t.string :name
      t.string :breed
      t.integer :sex
      t.integer :size
      t.integer :age
      t.integer :activity_level
      t.boolean :house_trained
      t.boolean :spayed_neutered
      t.boolean :special_needs
      t.boolean :available

      t.timestamps null: false
    end
  end
end
