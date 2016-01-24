class GamesController < ApplicationController
 before_action :set_game, only: [:show, :play]

  def show
    @players = @game.players
  end

  def play
    @players = @game.players
  end

private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:id, :honoree_name, :event_date, :require_password, :password)
  end
end


