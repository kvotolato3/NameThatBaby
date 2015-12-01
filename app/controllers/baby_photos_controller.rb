class BabyPhotosController < ApplicationController
  def index
    @babyphotos = BabyPhoto.all
  end
end
