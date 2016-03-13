class Game < ActiveRecord::Base
  has_many :players, dependent: :delete_all

  validates :event_date, :honoree_name, presence: true

  def players_with_photos_array
    players_array = []
    self.players.each do |player|
      current_upload = player.uploads.last
      if current_upload != nil
        aws_s3_bucket = current_upload.aws_s3_bucket
        aws_s3_key = current_upload.aws_s3_key
        players_array.push({:player => player, :aws_s3_bucket => aws_s3_bucket, :aws_s3_key => aws_s3_key})
      end
    end
    return players_array
  end

  def all_players_array
    players_array = []
    self.players.each do |player|
      current_upload = player.uploads.last
      if current_upload != nil
        aws_s3_bucket = current_upload.aws_s3_bucket
        aws_s3_key = current_upload.aws_s3_key
        players_array.push({:player => player, :aws_s3_bucket => aws_s3_bucket, :aws_s3_key => aws_s3_key})
      else
        players_array.push({:player => player, :aws_s3_bucket => nil, :aws_s3_key => nil})
      end
    end
    return players_array
  end
end
