class RemoveDurationColumnFromVisit < ActiveRecord::Migration
  def change
    remove_column :visits, :duration
  end
end
