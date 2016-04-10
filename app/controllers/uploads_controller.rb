class UploadsController < ApplicationController
  include Transloadit::Rails::ParamsDecoder

  def new
  end

  def create
    transloadit_response = params[:transloadit]
    player_id = params[:player_id]
    aws_s3_bucket = 'kathleen-namethatbaby'
    aws_s3_key = 'photos/' + transloadit_response[:assembly_id].to_s + '/' + transloadit_response[:results][:resize].first[:name]
    upload = Upload.new(user_id: current_user.id, player_id: player_id, aws_s3_bucket: aws_s3_bucket, aws_s3_key: aws_s3_key, transloadit_response: transloadit_response)
    if upload.save
      redirect_to edit_player_path(Player.find(player_id)), notice: 'Photo successfully uploaded.'
    else
      render :new
    end
  end
end
