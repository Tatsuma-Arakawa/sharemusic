class Users::RegistrationsController < Devise::RegistrationsController
  before_action :check_guest, only: %i(update destroy)

  protected

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end
end
