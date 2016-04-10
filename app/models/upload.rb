class Upload < ActiveRecord::Base
  belongs_to :user

  attr_accessor :player_id

  after_create :assign_player

private
  def assign_player
    Player.find(@player_id).update(upload_id: self.id)
  end
end
