class HotelsController < ApplicationController
before_action :set_hotel, only: [:show]
before_action :require_hotel, only: [:index, :show]

  def index
    # @hotels = Hotel.all
    @rooms = Room.all

  end

  def show
    @user = User.new
    @room = Room.new
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
  def set_hotel
    @hotel = Hotel.find(params[:id])
  end
    def hotel_params
      params.require(:hotel).permit(:name, :email, :password, :hotel_id)
    end

end
