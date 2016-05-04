class AddPlayableToPlayers < ActiveRecord::Migration
  def up
    rename_column :players, :user_id, :playable_id
    add_column :players, :playable_type, :string
    Player.update_all(playable_type: 'user')
    change_column :players, :playable_type, :string, null: false
    change_column :players, :playable_id, :integer, null: false
  end

  def down
    rename_column :players, :playable_id, :user_id
    remove_column :players, :playable_type, :string
  end
end
