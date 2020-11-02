class PagesController < ApplicationController
  def home
    @albumboards = AlbumBoard.all
  end
end
