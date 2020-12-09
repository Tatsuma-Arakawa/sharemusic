class PagesController < ApplicationController
  def home
    @albumboards = AlbumBoard.paginate(page: params[:page], per_page: 10).order("id DESC")
  end
end
