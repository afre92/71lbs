class SessionsController < ApplicationController
  def new
  end

  def create
  @hotel = Hotel.find_by_email(params[:session][:email])
  if @hotel && @hotel.authenticate(params[:session][:password])
    session[:hotel_id] = @hotel.id
    redirect_to @hotel
  else
    redirect_to login_path
  end
end

def destroy
  session[:hotel_id] = nil
  redirect_to '/'
end

end
