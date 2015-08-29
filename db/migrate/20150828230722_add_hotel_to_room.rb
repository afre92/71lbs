class AddHotelToRoom < ActiveRecord::Migration
  def change
    add_reference :rooms, :hotel, index: true, foreign_key: true
  end
end
