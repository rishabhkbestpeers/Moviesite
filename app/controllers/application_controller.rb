class ApplicationController < ActionController::Base

    before_action :authenticate_user!
    
    before_action :configure_permitted_parameters, if: :devise_controller?

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
    end
    

    protected

    def configure_permitted_parameters
        attributes = [:role]
        devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
        devise_parameter_sanitizer.permit(:account_update, keys: attributes)
    end
end
