class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?
	protect_from_forgery with: :exception
	def active_for_authentication?
    	super && current_user.deleted == false
    end
	
	def after_sign_in_path_for(resource)
    	users_path
    end

	protected
        def configure_permitted_parameters
        	devise_parameter_sanitizer.permit(:sign_up, keys:[:last_name, :last_name_kana, :first_name, :first_name_kana, :nickname, :email])
        end
end
