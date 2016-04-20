class RemoveColumnFromAnimals < ActiveRecord::Migration
  def change
    remove_column :animals, :species, :string
  end
end
