class UploadsController < ApplicationController
  include Transloadit::Rails::ParamsDecoder

  def new
    @user = User.find(Player.find(params['player_id']).user_id)
    if user_signed_in?
      render :new
    elsif session[:guest_key] && @user.guest_key == session[:guest_key]
      render :new
    else
      redirect_to root_path
    end
  end

  def create
    transloadit_response = params[:transloadit]
    player = Player.find(params[:player_id])
    aws_s3_bucket = 'kathleen-namethatbaby'
    aws_s3_key = 'photos/' + transloadit_response[:assembly_id].to_s + '/' + transloadit_response[:results][:resize].first[:name]
    # player_id is a virtual attribute
    upload = Upload.new(user_id: User.find(player.user_id).id,
      player_id: player.id,
      aws_s3_bucket: aws_s3_bucket,
      aws_s3_key: aws_s3_key,
      transloadit_response: transloadit_response
    )
    if upload.save
      redirect_to edit_player_path(player), notice: 'Photo successfully uploaded.'
    else
      render :new
    end
  end
end
