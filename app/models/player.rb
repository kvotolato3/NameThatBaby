class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :uploads

  validates :name, :email, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i,
    message: "is invalid" }

  def is_only_host
   # 1 - check if the player is a host
    if self.is_host == true
      # 2. check if there are multiple hosts on the game
      number_of_hosts = Game.find(self.game_id).players.where(is_host: true).count
      if number_of_hosts > 1
        # player is one of multiple hosts
        return false
      else
        # if not, the player is the only host
        return true
      end
    else
      # player is not a host
      return false
    end
  end

end


