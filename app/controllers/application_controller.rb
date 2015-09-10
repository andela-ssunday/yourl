class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper_method :current_user
  protect_from_forgery with: :exception

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by_id(session[:user_id])
    end
  end



  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ::ActionController::RoutingError, with: :no_route_found
  # rescue_from ::ActionController::NoMethodError, with: :no_record_found


  def no_route_found
    flash[:notice] = "Invalid address!"
    redirect_to root_path
  end

  def record_not_found(exception)
    flash[:notice] = exception.message.to_s
    redirect_to root_path
  end

  def no_record_found
    flash[:notice] = "No record Found"
    redirect_to root_path
  end

end
