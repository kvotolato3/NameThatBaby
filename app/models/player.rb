class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  has_many :uploads

  validates :name, :email, presence: true
  validates :email, format: { with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}\b/i,
    message: "is invalid" }
end

