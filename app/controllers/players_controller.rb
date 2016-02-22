class PlayersController < ApplicationController
before_action :set_player, only: [:edit, :update]
  def index
    @players = Player.all
  end

  def edit
    if @player.current_upload_id == nil
      @current_upload = nil
    else
      @current_upload = Upload.find(@player.current_upload_id)
    end
  end

  def update
    @game = Game.find(@player.game_id)

    if @player.update(player_params)
      redirect_to @game, notice: 'Player was successfully updated.'
    else
      render :edit
    end
  end

private
  def set_player
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:id, :name, :aws_s3_bucket, :aws_s3_key, :game_id, :email)
  end
end
