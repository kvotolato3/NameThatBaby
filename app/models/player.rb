class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :uploads
end

