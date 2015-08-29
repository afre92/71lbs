class Room < ActiveRecord::Base
  belongs_to :hotel
  has_many :reservations
  has_many :users, through: :reservations
  validates_uniqueness_of :number

end
