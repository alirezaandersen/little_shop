class ChangeSpecialNeedsToDefault < ActiveRecord::Migration
  def change
    change_column_default(:animals, :special_needs, false)
  end
end
