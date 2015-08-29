class Hotel < ActiveRecord::Base
  has_secure_password
  has_many :users
  has_many :rooms
  validates_presence_of :name, :email

end
