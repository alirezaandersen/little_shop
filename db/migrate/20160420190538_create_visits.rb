class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.date :date
      t.time :time
      t.references :user, index: true, foreign_key: true
      t.references :animal, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
