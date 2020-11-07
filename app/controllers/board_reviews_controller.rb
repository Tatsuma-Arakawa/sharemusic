class BoardReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @albumboard = AlbumBoard.find(params[:album_board_id])
    @boardreview = current_user.board_reviews.build(boardreview_params)
    @boardreview.album_board_id = params[:album_board_id]
    if @boardreview.save
      flash[:notice] = 'レビューを作成しました'
      redirect_to request.referer
    else
      flash[:alert] = "レビューを作成出来ませんでした"
      redirect_to album_board_path(@albumboard)
    end
  end

  def destroy
    @boardreview = current_user.board_reviews.find(params[:id])
    if @boardreview.destroy
      flash[:notice] = "レビューを削除しました"
      redirect_to request.referer
    end
  end

  private
  
    def boardreview_params
      params.require(:board_review).permit(:content, :score, :user_id, :album_board_id, :title)
    end
end
