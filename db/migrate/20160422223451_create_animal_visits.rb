class CreateAnimalVisits < ActiveRecord::Migration
  def change
    create_table :animal_visits do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :visit, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
