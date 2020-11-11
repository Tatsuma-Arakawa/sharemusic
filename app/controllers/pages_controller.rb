class PagesController < ApplicationController
  def home
    @albumboards = AlbumBoard.paginate(page: params[:page], per_page: )
  end
end
