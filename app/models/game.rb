class Game < ActiveRecord::Base
  has_many :players, dependent: :delete_all

  validates :event_date, :honoree_name, presence: true
end
