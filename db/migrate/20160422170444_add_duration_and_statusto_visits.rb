class AddDurationAndStatustoVisits < ActiveRecord::Migration
  def change
    add_column :visits, :duration, :integer
    add_column :visits, :status, :integer
  end
end
