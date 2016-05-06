class GamesController < ApplicationController
 before_action :set_game, only: [:show, :play, :edit, :update, :destroy]
 before_action :authenticate_user!

  def landing_page
    if user_signed_in?
      redirect_to my_games_path
    else
      # Reset session variable if user returns to this page
      session[:email] = nil if session[:email]
    end

  end

  def my_games
    @my_email = current_user.email
    @my_hosted_games = Game.my_hosted_games(@my_email)
    @my_played_games = Game.my_played_games(@my_email)
  end

  def show
    @my_email = current_user.email
    @players = @game.all_players_array
    @host_names = @game.host_names_array
  end

  def play
    game = Game.find(params[:id])
    @event_date = game.event_date.to_formatted_s(:long_ordinal)
    @honoree_name = game.honoree_name
    @players = @game.players_with_photos_array
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
    @game.initial_host_user_id = current_user.id
    if @game.save
      # after_create :create_initial_host
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @game.destroy
    redirect_to my_games_path
  end


private
  def set_game
    @game = Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(:id, :honoree_name, :event_date, :require_password, :password)
  end
end


