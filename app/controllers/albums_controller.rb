class AlbumsController < ApplicationController
  def index
    @album=current_user.albums.all
  end

  def show
    @album = Album.find(params[:id])
  end

  def new
    @album=Album.new
  end

  def create
    @album=Album.new(album_params)
    @album.user_id=current_user.id
    if @album.save
      redirect_to albums_path
    else
      render :new
    end
  end



  private
  def album_params
    params.require(:album).permit(:name,:Created_date,:Owner)
  end
end
