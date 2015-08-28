class User < ActiveRecord::Base
  belongs_to :hotel
  has_many :reservations
end
