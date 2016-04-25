class AddSessionColumnToUsers < ActiveRecord::Migration
  def change
    add_column :users, :session, :text, default: "{}"
  end
end
