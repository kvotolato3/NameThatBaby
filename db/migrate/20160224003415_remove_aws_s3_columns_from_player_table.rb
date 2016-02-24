class RemoveAwsS3ColumnsFromPlayerTable < ActiveRecord::Migration
  def up
    remove_column :players, :aws_s3_bucket, :string
    remove_column :players, :aws_s3_key, :string
  end

  def down
    add_column :players, :aws_s3_bucket, :string
    add_column :players, :aws_s3_key, :string
  end
end
