class UndoValidationsOnGames < ActiveRecord::Migration
  def change
    change_column :games, :event_date, :date, :null => true
    change_column :games, :honoree_name, :string, :null => true
  end
end
