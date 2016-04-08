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
    email = player_params['email'].downcase
    @player = Player.new(game: @game, role: 'player')

    if user = User.find_by(email: email) # If there is a User associated with the email, use it
      @player.user_id = user.id

      if player_params['role'] == 'host'
          @player.make_host
      end

      if @player.save
        redirect_to @game, notice: 'Player was successfully added.'
      else
        render :new
      end

    else # Else, if valid, create a guest user
      guest_user = User.create_guest(player_params['name'], email)
      if guest_user.persisted?
        @player.user_id = guest_user.id

        if player_params['role'] == 'host'
          @player.make_host
        end

        if @player.save
          redirect_to @game, notice: 'Player was successfully added.'
        else
          render :new
        end

      else
        @guest_user = guest_user
        @guest_user.errors.messages.delete(:password) #Remove the password error
        render :new
      end
    end
  end

  def edit
    @current_upload = @player.uploads.last
    @game = Game.find(@player.game_id)
    @user = User.find(@player.user_id)
  end

  def update
    @game = Game.find(@player.game_id)
    @user = User.find(@player.user_id)
    if @user.update(email: player_params['email'], name: player_params['name'])
      if @player.role != player_params['role']
        if player_params['role'] == 'host'
          @player.make_host
        end

        if player_params['role'] == 'player'
          @player.role = 'player'
          if @player.is_pending_host == true
            @player.is_pending_host == false
          end
        end
      end
      if @player.save
        redirect_to @game, notice: 'Player was successfully updated.'
      else
        render :edit
      end
    else
      render :edit
    end
  end

  def destroy
    @game = Game.find(@player.game_id) # Needed in case of render :edit
    @user = User.find(@player.user_id) # Needed in case of render :edit
    if @player.is_creator? == false
      if @player.destroy
        redirect_to @game, notice: 'Player was successfully deleted.'
      else
        render :edit
      end
    else
      flash.now[:notice] = 'Ooops! This player cannot be deleted because he/she is the creator.'
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
    params.require(:player).permit(:id, :game_id, :user_id, :role, :name, :email)
  end
end
