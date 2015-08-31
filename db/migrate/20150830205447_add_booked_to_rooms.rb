class AddBookedToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :booked, :boolean, default: false
  end
end
