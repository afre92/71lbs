class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.integer :number
      t.references :reservation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
