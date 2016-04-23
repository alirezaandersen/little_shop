class RemoveAnimalReferenceFromVisits < ActiveRecord::Migration
  def change
    remove_reference(:visits, :animal, index: true, foreign_key: true)
  end
end
