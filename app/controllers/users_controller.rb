class UsersController < ApplicationController
  def index
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
  end
end
