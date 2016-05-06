class SessionsController < Devise::SessionsController
  def new
    # if email was entered in previous step, assign it to an instance variable
    # then remove it from the session variable
    if @email = session[:email]
      # If user is a guest don't send the email through
      if User.find_by(email: @email).is_guest == true
       @email = nil
      end
      session[:email] = nil
    end
    super
  end
end
