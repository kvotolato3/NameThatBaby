class GuestSessionsController < ApplicationController
  def new
    @email = session[:email]
  end

  def create
    key = params['4-digit key']
    user = User.find_by(email: params['email'])
    if user.guest_key == key
      session[:guest_key] = key
      redirect_to player_path(user.players.last)
    else
      @email = session[:email]
      flash.now[:notice] = 'Key was incorrect'
      render :new
    end
  end
end

