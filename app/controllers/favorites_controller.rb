class FavoritesController < ApplicationController
  before_action :set_boardreview

  def create
    @favorite = current_user.favorites.create(board_review_id: params[:id])
    @boardreview.create_notification_favorite!(current_user)
  end

  def destroy
    @favorite = current_user.favorites.find_by(board_review_id: params[:id]).destroy
  end

  private

  def set_boardreview
    @boardreview = BoardReview.find(params[:id])
  end
end
