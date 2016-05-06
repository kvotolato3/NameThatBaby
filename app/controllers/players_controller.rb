class PlayersController < ApplicationController
before_action :set_player, only: [:edit, :update, :destroy, :show]
before_action :set_game, only: [:new, :create]
before_action :authenticate_user!, only: [:index, :new, :destroy]

  def index
    @players = Player.all
  end

  def show
    @user = User.find(@player.user_id)
    @game = Game.find(@player.game_id)
    @current_upload = @player.current_upload
    @host_names = @game.host_names_array
    @game_uploads_count = @game.uploads_count
    @game_players_count = @game.players.count
    @user_players_games = @user.players_games_array(@player)
    if session[:guest_key] && @user.guest_key == session[:guest_key]
      render :guest_show
    else
      redirect_to root_path
    end
  end

  def new
    @player = Player.new
  end

  def create
    email = params['email'].downcase
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
      guest_user = User.create_guest(params['name'], email)
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
    @current_upload = @player.current_upload
    @game = Game.find(@player.game_id)
    @user = User.find(@player.user_id)
    if user_signed_in?
      render :edit
    elsif session[:guest_key] && @user.guest_key == session[:guest_key]
      render :guest_edit
    else
      redirect_to root_path
    end
  end

  def update
    @game = Game.find(@player.game_id)
    @user = User.find(@player.user_id)
    @current_upload = @player.current_upload
    if user_signed_in?
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
     elsif session[:guest_key] && @user.guest_key == session[:guest_key]
      if @user.update(email: player_params['email'], name: player_params['name'])
        redirect_to player_path(@player), notice: 'Your information has been saved!'
      else
        render :guest_edit
      end
      # if everything is valid, render guest_show with notice: Your information has been saved!
      # if not valid, render guest_edit
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
