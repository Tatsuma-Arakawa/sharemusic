class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]
  before_action :admin_user, only: :destroy

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show
    @user = User.find(params[:id])
    @review_albums = @user.board_reviews.paginate(page: params[:page], per_page: 10)
  end

  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def search
    @users = User.search(params[:search])
    @users = @users.paginate(page: params[:page], per_page: 10)
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "ユーザーを削除しました"
    redirect_to request.referer
  end

  private

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
