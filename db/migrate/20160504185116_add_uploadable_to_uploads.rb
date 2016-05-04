class AddUploadableToUploads < ActiveRecord::Migration
  def up
    rename_column :uploads, :user_id, :uploadable_id
    add_column :uploads, :uploadable_type, :string
    Upload.update_all(uploadable_type: 'user')
    change_column :uploads, :uploadable_type, :string, null: false
    change_column :uploads, :uploadable_id, :integer, null: false
  end

  def down
    rename_column :uploads, :uploadable_id, :user_id
    remove_column :uploads, :uploadable_type, :string
  end
end
