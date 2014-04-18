
class ApplicationController < ActionController::Base
  
  
  
  protect_from_forgery
  
  layout :layout_by_resource
  
 

 
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = "Access denied."
    redirect_to root_url
  end
  
  

  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == 'new'
      "index"
    else
      "main"
    end
  end
  
  
  
  #  before_filter :configure_permitted_parameters, if: :devise_controller?
  #    
  #    protected
  #
  #    def configure_permitted_parameters
  #      # devise_parameter_sanitizer.for(:sign_up) << :username
  #      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :email) }
  #    end
  # 
  
  before_filter :configure_permitted_parameters, if: :devise_controller?

    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit :username, :email, :password, :password_confirmation
      end
    end
    
    
  end
