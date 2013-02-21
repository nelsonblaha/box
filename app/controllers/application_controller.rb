class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :check_admin

  def check_admin
    if current_user && current_user.admin 
      true
    else
      redirect_to root_url, notice: "Dear beloved user, you are not authorized to access this!"
    end
  end
end
