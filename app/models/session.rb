class Session < ActiveRecord::Base
  validates_presence_of :email, :password, :name
end
