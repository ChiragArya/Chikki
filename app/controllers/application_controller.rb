class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  #devise_controller? method is provided by Devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  #we simply permit the :name attribute for account creation and editing
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << :name
	devise_parameter_sanitizer.for(:account_update) << :name
  end
  
  # to rescue from the exception created by find method in coversation controller get_conversation
  rescue_from ActiveRecord::RecordNotFound do
  	flash[:warning] = 'Resource not found.'
  	redirect_back_or root_path
  end

  def redirect_back_or(path)
  	#simply redirecting the user back with a warning message if the referer field is not set 
  	redirect_to request.referer || path
  end

end
