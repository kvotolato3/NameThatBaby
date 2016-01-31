class AddIsHostToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :is_host, :boolean
    add_column :players, :host_user_id, :integer
  end
end
