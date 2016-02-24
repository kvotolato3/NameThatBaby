class PlayersController < ApplicationController
before_action :set_player, only: [:edit, :update, :destroy]
before_action :set_game, only: [:new, :create]

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @player.game_id = @game.id

    if @player.save
      redirect_to @game, notice: 'Player was successfully added.'
    else
      render :new
    end
  end

  def edit
    @current_upload = @player.uploads.last
  end

  def update
    @game = Game.find(@player.game_id)

    if @player.update(player_params)
      redirect_to @game, notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    game = Game.find(@player.game_id)
    if @player.destroy
      redirect_to game, notice: 'Player was successfully deleted.'
    else
      render :edit
    end
  end

private
  def set_player
    @player = Player.find(params[:id])
  end

  def set_game
    @game = Game.find(params[:game_id])
  end

  def player_params
    params.require(:player).permit(:id, :name, :aws_s3_bucket, :aws_s3_key, :game_id, :email)
  end
end
