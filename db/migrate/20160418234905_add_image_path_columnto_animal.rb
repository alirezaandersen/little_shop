class AddImagePathColumntoAnimal < ActiveRecord::Migration
  def change
    add_column :animals, :image_path, :text
  end
end
