class UsersController < ApplicationController
  def guest
    user = User.find(params[:id])
    if user.guest_key == session[:guest_key]
      #session[:guest_key] must match user guest key in order to see this view
      render :guest
    else
      redirect_to root_path
    end
  end

  def email_lookup
    email = params['email'].downcase
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
