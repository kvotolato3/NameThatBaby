class ChangeUploadsTable < ActiveRecord::Migration
  def change
    add_column :uploads, :player_id, :integer
    add_column :uploads, :aws_s3_bucket, :string
    add_column :uploads, :aws_s3_key, :string
    add_column :uploads, :transloadit_response, :text
  end
end
