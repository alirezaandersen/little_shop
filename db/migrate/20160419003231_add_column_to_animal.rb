class AddColumnToAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :description, :text
  end
end
