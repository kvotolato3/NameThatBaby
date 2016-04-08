class Game < ActiveRecord::Base
  has_many :players, dependent: :delete_all

  validates :event_date, :honoree_name, presence: true

  attr_accessor :initial_host_user_id

  after_create :create_initial_host

  def players_with_photos_array
    players_array = []
    self.players.each do |player|
      current_upload = player.uploads.last
      user = User.find(player.user_id)
      if current_upload != nil
        aws_s3_bucket = current_upload.aws_s3_bucket
        aws_s3_key = current_upload.aws_s3_key
        players_array.push({:name => user.name, :email => user.email, :id => player.id, :aws_s3_bucket => aws_s3_bucket, :aws_s3_key => aws_s3_key})
      end
    end
    return players_array
  end

  def all_players_array
    players_array = []
    self.players.each do |player|
      current_upload = player.uploads.last
      user = User.find(player.user_id)
      if current_upload != nil
        aws_s3_bucket = current_upload.aws_s3_bucket
        aws_s3_key = current_upload.aws_s3_key
        players_array.push({:name => user.name, :email => user.email, :id => player.id, :aws_s3_bucket => aws_s3_bucket, :aws_s3_key => aws_s3_key})
      else
        players_array.push({:name => user.name, :email => user.email, :id => player.id, :aws_s3_bucket => nil, :aws_s3_key => nil})
      end
    end
    return players_array
  end

  def host_names_array
    names = []
    self.players.where(role: 'host').each do |host|
      names.push(User.find(host.user_id).name)
    end
    return names
  end

  def self.my_hosted_games(email)
    user = User.find_by(email: email)
    return Game.where(id: Player.where(user: user).where(role: 'host').pluck(:game_id))
  end

  def self.my_played_games(email)
    user = User.find_by(email: email)
    return Game.where(id: Player.where(user: user).where(role: 'player').pluck(:game_id))
  end

private
  def create_initial_host
    Player.create(role: 'host', is_creator: true, user_id: @initial_host_user_id, game_id: self.id)
  end
end
