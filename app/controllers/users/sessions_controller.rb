class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'You logged in as a guest user'
  end
end