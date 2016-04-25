class ChangeColumnStatusToDefault < ActiveRecord::Migration
  def change
    change_column_default :visits, :status, 0
  end
end
