class SessionsController < Devise::SessionsController
  def new
    # if email was entered in previous step, assign it to an instance variable
    # then remove it from the session variable
    if @email = session[:email]
      session[:email] = nil
    end
    super
  end
end
