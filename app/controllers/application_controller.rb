class ApplicationController < ActionController::Base
  protect_from_forgery
  layout :layout_by_resource
  protected

  def layout_by_resource
    if devise_controller?
      "devise"
    else
      "application"
    end

  end
  def after_sign_out_path_for(resource)
     user_session_path
  end

end
