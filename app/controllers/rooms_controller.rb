class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  before_action :require_hotel, only: [:index, :show, :new, :destroy, :edit]
  before_action :set_hotel, only: [:create]


  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show

    if params[:search]
      @reservations = @room.reservations.where(['arrival LIKE ?', "%#{params[:search]}%"])
    else
      @reservations = @room.reservations
    end

  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = @hotel.rooms.new(room_params)
    # @room.hotel = @room

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room.hotel, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { redirect_to @hotel, notice: 'Room could not be created, please choose a nonexisting number'}
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room.hotel, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    if @room.reservations.count >= 1
      flash[:notice] = "Room can't be remove because it has a reservation attached"
      redirect_to @room.hotel
    else
    @room.destroy
    respond_to do |format|
      format.html { redirect_to @room.hotel, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
    end
  end

  private
    def set_hotel
      @hotel = Hotel.find(params[:hotel_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:number, :reservation_id, :hotel_id)
    end
 end
