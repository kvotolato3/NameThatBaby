class GuestSessionsController < ApplicationController
  def new
    @email = session[:email]
  end

  def create
    key = params['4-digit key']
    user = User.find_by(email: params['email'])
    if user.guest_key == key
      session[:guest_key] = key
      redirect_to edit_player_path(user.players.last)
      # create a session variable with the key
      # redirect_to edit_player_path
    else
      render :new, notice: 'Key was incorrect'
    end
  end
end

