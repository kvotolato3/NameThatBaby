class Player < ActiveRecord::Base
  belongs_to :game
  belongs_to :user
  belongs_to :upload

  validates :role, :inclusion  => { :in => [ 'player', 'host'],
    :message    => "%{value} is not a valid role" }

  ROLES = [['Player','player'],['Host','host']]

  def make_host
    if User.find(self.user_id).is_guest == false
      self.role = 'host'
    else
      self.role = 'host'
      self.is_pending_host = true
    end
  end

  def current_upload
    if self.upload_id == nil
      return nil
    else
      return Upload.find(self.upload_id)
    end
  end
end


