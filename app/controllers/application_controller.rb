class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
  	protected
  	def configure_permitted_parameters
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
    	devise_parameter_sanitizer.permit(:log_in, keys: [:name])
  	end

	def after_sign_in_path_for(resource)
		show_user_path(resource)
	end

end

