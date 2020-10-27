class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(resource.id)
  end

  def after_update_path_for(resource)
    user_path(id: current_user.id)
  end

  def check_guest
    email = resource&.email || params[:user][:email].downcase
    if email == 'guest@example.com'
      redirect_to root_path, alert: 'Guest users cannot be edited or deleted.'
    end
  end
  
  private
    def sign_in_required
        redirect_to new_user_session_url unless user_signed_in?
    end

    def configure_permitted_parameters
      added_attrs = [ :email, :username, :password, :password_confirmation, :image, :introduce ]
      devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_up, keys: [:name, :image]
      devise_parameter_sanitizer.permit :account_update, keys: added_attrs
      devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
      devise_parameter_sanitizer.permit :account_update, keys: [:name, :introduce]
    end
end
