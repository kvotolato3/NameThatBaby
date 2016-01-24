class GamesController < ApplicationController
  def show
    @game = Game.find(params[:id])
  end

private
  def game_params
    params.require(:game).permit(:id, :honoree_name, :event_date, :require_password, :password)
  end
end


