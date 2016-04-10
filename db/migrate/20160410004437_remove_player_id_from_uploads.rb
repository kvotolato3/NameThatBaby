class RemovePlayerIdFromUploads < ActiveRecord::Migration
  def change
    remove_column :uploads, :player_id, :integer
  end
end
