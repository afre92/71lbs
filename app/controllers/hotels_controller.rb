class HotelsController < ApplicationController
before_action :require_hotel, only: [:index, :show]



  def index
    @hotels = Hotel.all
    @users= User.all
    @rooms= Room.all
  end

  def show
  end

  def new
    @hotel = Hotel.new
  end
  def create
    @hotel = Hotel.new(hotel_params)
    if @hotel.save
      session[:hotel_id] = @hotel.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  private
    def hotel_params
      params.require(:hotel).permit(:name, :email, :password)
    end

end
