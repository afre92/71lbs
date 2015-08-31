class Change < ActiveRecord::Migration
  def change
    rename_column :reservations, :from, :arrival
    rename_column :reservations, :to, :departure
  end
end
