class AlbumBoardsController < ApplicationController
  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])
  
  def search
    @albumboards = AlbumBoard.all
    if params[:search].present?
      @searchalbums = RSpotify::Album.search(params[:search])
    end
  end
end
