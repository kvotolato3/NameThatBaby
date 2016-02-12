class GamesController < ApplicationController
 before_action :set_game, only: [:show, :play, :edit, :update, :destroy]

  def landing_page
    if user_signed_in?
      redirect_to my_games_games_path
    end
  end

  def my_games
    @my_email = current_user.email
    @my_hosted_games = Game.where(id: Player.where(email: @my_email, is_host: true).pluck(:game_id))
    @my_played_games = Game.where(id: Player.where(email: @my_email, is_host: false).pluck(:game_id))
  end

  def show
    @my_email = current_user.email
    @players = @game.players
    @hosts = @players.where(is_host: true)
  end

  def play
    game = Game.find(params[:id])
    @event_date = game.event_date.to_formatted_s(:long_ordinal)
    @honoree_name = game.honoree_name
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

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      @host = Player.new(name: current_user.name, email: current_user.email, is_host: true, user: current_user, game: @game)
        if @host.save
          redirect_to @game, notice: 'Game was successfully created.'
        else
          render :new
        end
    else
      render :new
    end
  end

  def destroy
    @game.destroy
    redirect_to my_games_games_path
  end


private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:id, :honoree_name, :event_date, :require_password, :password)
  end
end


