class RevertPolymorphicMigrations < ActiveRecord::Migration
  require_relative '20160504184720_create_guests_table'
  require_relative '20160504185116_add_uploadable_to_uploads'
  require_relative '20160504192122_add_index_to_uploadable'
  require_relative '20160504192400_add_playable_to_players'
  require_relative '20160504192818_add_index_to_playable'

  def change
    revert AddIndexToPlayable
    revert AddPlayableToPlayers
    revert AddIndexToUploadable
    revert AddUploadableToUploads
    revert CreateGuestsTable
  end
end
