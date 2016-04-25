class DropDurationsTable < ActiveRecord::Migration
  def change
    remove_reference :visits, :duration
    drop_table :durations
  end
end
