class CreateDurations < ActiveRecord::Migration
  def change
    create_table :durations do |t|
      t.integer :time

      t.timestamps null: false
    end
  end
end
