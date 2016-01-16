class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :honoree_name
      t.date :event_date
      t.string :password
      t.boolean :require_password
      t.timestamps
    end
  end
end
