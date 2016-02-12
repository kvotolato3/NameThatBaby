class ChangeValidationsOnGame < ActiveRecord::Migration
  def change
    change_column :games, :event_date, :date, :null => false
    change_column :games, :honoree_name, :string, :null => false
  end
end
