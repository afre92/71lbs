class AddRoomToReservations < ActiveRecord::Migration
  def change
    add_reference :reservations, :room, index: true, foreign_key: true
  end
end
