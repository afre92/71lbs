class User < ActiveRecord::Base
  belongs_to :hotel
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservation
  validates_presence_of :first_name, :last_name
end
