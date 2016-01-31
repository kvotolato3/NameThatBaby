class RenameHostUserIdInPlayersTable < ActiveRecord::Migration
  def up
    rename_column :players, :host_user_id, :user_id
  end

  def down
    rename_table :players, :user_id, :host_user_id
  end
end
