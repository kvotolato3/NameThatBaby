class GuestSessionsController < ApplicationController
  def new
    @email = session[:email]
  end

  def create
    key = params['4-digit key']
    user = User.find_by(email: params['email'])
    if user.guest_key == key
      session[:guest_key] = key
      redirect_to guest_path(user)
      # create a session variable with the key
      # redirect_to guest view
    else
      render :new, notice: 'Key was incorrect'
    end
  end

  def email_lookup
    email = params["email"].downcase
    user_status = User.user_status(email)
    if user_status == 'guest'
      session[:email] = email
      redirect_to new_guest_session_path
    end
    if user_status == 'regular'
      session[:email] = email
      redirect_to new_user_session_path
    end
    if user_status == 'nil'
      redirect_to root_path, notice: 'Email not found.'
    end
  end
end

