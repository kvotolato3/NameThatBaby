class AddIndexToUploadable < ActiveRecord::Migration
  def change
    add_index :uploads, [:uploadable_type, :uploadable_id]
  end
end
