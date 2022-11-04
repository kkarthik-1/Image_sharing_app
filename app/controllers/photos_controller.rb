class PhotosController < ApplicationController
  before_action :find_album ,only: [:new,:create ]
  def index
  end

  def new
    @photo=@album.photos.build
  end

  def create
    @photo=@album.photos.build(photos_params)
    @photo.user_id=current_user.id
    if @photo.save
      redirect_to albums_path
    else
      render :new
    end
  end

    def show
      @photo =Photo.find(params[:id])
    end



  private

  def find_album
    @album = Album.find(params[:album_id])
  end

  def photos_params
    params.require(:photo).permit(:tagline,:created_date,:owner,:image)
  end
end
