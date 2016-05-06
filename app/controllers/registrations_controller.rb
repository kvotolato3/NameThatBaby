class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def new
    if @email = session[:email]
      @name = User.find_by(email: @email).name
    end
    super
  end

  def create
    if @email = session[:email]
      # Change email on Guest so the new User passes uniqueness constraint
      temp_email = "guest_#{Time.now.to_i}@example.com"
      User.find_by(email: @email).update(email: temp_email)
    end
    super
    logging_in(temp_email)
  end

  def logging_in(email)
    # only execute the following if there is a guest
    if guest = User.find_by(email: email)
      # reassign uploads from guest to current user
      Upload.where(user: guest).each do |upload|
        upload.update(user: current_user)
      end

      # reassign players from guest to current user
      # and set is_pending_host to false if true
      Player.where(user: guest).each do |player|
        player.update(user: current_user)
        player.update(is_pending_host: false) if player.is_pending_host == true
      end

      # delete guest user
      guest.destroy

      # delete session variable
      session[:email] = nil
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << :name
  end
end
