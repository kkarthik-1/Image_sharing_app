class HomeController < ApplicationController
  def index
    @photos=Photo.all.order(created_at: :desc).limit(25)
  end

  def all_album
    @album=Album.all
  end

end
