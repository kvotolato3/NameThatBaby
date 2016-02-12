class Game < ActiveRecord::Base
  has_many :players, dependent: :delete_all
end
