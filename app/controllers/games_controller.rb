class GamesController < ApplicationController
 before_action :set_game, only: [:show, :play, :edit, :update]

  def landing_page
  end

  def my_games
    @my_hosted_games = Game.where(id: Player.where(email: params[:user][:email], is_host: true).pluck(:game_id))
    @my_played_games = Game.where(id: Player.where(email: params[:user][:email], is_host: false).pluck(:game_id))
  end

  def show
    @players = @game.players
  end

  def play
    @players = @game.players
  end

  def edit
  end

  def update
    if @game.update(game_params)
      redirect_to @game, notice: 'Game was successfully updated.'
    else
      render :edit
    end
  end


private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:id, :honoree_name, :event_date, :require_password, :password)
  end
end


