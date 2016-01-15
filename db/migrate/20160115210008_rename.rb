class Rename < ActiveRecord::Migration
  def up
    rename_table :baby_photos, :players
  end

  def down
    rename_table :players, :baby_photos
  end
end
