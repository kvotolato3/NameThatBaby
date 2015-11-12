class CreateBabyPhotos < ActiveRecord::Migration
  def change
    create_table :baby_photos do |t|
      t.string :name
      t.string :aws_s3_bucket
      t.string :aws_s3_key
      t.timestamps null: false
    end
  end
end
