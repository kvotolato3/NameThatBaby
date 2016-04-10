class AddUploadIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :upload_id, :integer
  end
end
