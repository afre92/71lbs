class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_hotel

def current_hotel
  @current_hotel ||= Hotel.find(session[:hotel_id]) if session[:hotel_id]
end




def require_hotel
  redirect_to '/login' unless current_hotel
end

end
