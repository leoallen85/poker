class ApplicationController < ActionController::Base
  protect_from_forgery

  private
    
    rescue_from CanCan::AccessDenied do |exception|
      if current_user
        redirect_to root_path, :alert => exception.message
      else
        redirect_to new_user_session_path, :alert => "Log in to continue"
      end
    end

end
