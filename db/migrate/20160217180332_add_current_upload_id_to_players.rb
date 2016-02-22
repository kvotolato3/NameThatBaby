class AddCurrentUploadIdToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :current_upload_id, :integer
  end
end
