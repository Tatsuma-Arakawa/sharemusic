class AlbumBoardsController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
  
  def search
    @albumboards = AlbumBoard.all
    if params[:search].present?
      @searchalbums = RSpotify::Album.search(params[:search])
    end
  end

  def new
    @albumboard = AlbumBoard.new(albums: params[:artists])
    @album_icon = params[:icon]
  end

  def show
  end

  def edit
  end

  def create
    @albumboard = AlbumBoard.new(albumboard_params)
    @albumboard.remote_icon_url = params[:album_icon]
    if redirect_to @albumboard, notice: 'レビューを作成しました。'
    else
      render :new
    end
  end

  private

  def albumboard_params
    params.require(:album_board).permit(:albums, :icon)
  end
end
