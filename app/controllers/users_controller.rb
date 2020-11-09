class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:following, :followers]

  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    @users = User.paginate(page: params[:page])
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
end
