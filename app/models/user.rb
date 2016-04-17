class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_many :players, dependent: :delete_all
  has_many :uploads, dependent: :delete_all

  def self.create_guest(name, email)
    u = User.new(name: name, email: email, is_guest: true, guest_key: User.guest_key())
    u.valid?
    if u.errors.count > 1
      return u
    else
      u.save!(validate: false)
      return u
    end
  end

  def self.user_status(email)
    if user = User.find_by(email: email)
      if user.is_guest == true
        return "guest"
      else
        return "regular"
      end
    else
      return "nil"
    end
  end

private
  def self.guest_key
    key = ''
    4.times do |i|
      digit = rand(10).to_s
      key = key + digit
    end
    return key
  end
end
