class AddIsPendingHostToPlayers < ActiveRecord::Migration
  def up
    add_column :players, :is_pending_host, :boolean
  end

  def down
    remove_column :players, :is_pending_host, :boolean
  end
end
