class AddDurationToVisits < ActiveRecord::Migration
  def change
    add_reference :visits, :duration, index: true, foreign_key: true
  end
end
