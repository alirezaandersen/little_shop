class AddColumnDurationToAnimalVisit < ActiveRecord::Migration
  def change
    add_column :animal_visits, :duration, :integer
  end
end
