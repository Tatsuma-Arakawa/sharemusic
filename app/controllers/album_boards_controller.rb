class AlbumBoardsController < ApplicationController
  before_action :authenticate_user!

  require 'rspotify'
  RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_SECRET_ID'])

  def index
    @q = AlbumBoard.ransack(params[:q])
    @albumboards = @q.result(distinct: true)
    @albumboards = @albumboards.paginate(page: params[:page], per_page: 10)
  end

  def search
    @albumboards = AlbumBoard.all
    if params[:search].present?
      @searchalbums = RSpotify::Album.search(params[:search])
    end
  end

  def new
    @albumboard = AlbumBoard.new(albums: params[:albums])
    @album_icon = params[:icon]
  end

  def show
    @albumboard = AlbumBoard.find(params[:id])
    @boardreview = BoardReview.new
    @boardreviews = @albumboard.board_reviews.includes([:user]).order(id: :desc)
  end

  def edit
  end

  def create
    @albumboard = AlbumBoard.new(albumboard_params)
    @albumboard.remote_icon_url = params[:album_icon]
    if @albumboard.save
      redirect_to @albumboard, notice: "レビューページを新規作成しました"
    else
      render :new
    end
  end

  def destroy
    AlbumBoard.find(params[:id]).destroy
    flash[:success] = "レビューページを削除しました"
    redirect_to request.referer
  end

  private

    def albumboard_params
      params.require(:album_board).permit(:albums, :icon)
    end
end
