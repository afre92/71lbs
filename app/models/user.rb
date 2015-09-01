class User < ActiveRecord::Base
  belongs_to :hotel
  has_many :reservations, dependent: :destroy
  has_many :rooms, through: :reservation
  validates_presence_of :first_name, :last_name
  # validates_uniqueness_of :first_name, uniqueness: { scope: :last_name, message: "nagbro"}

  # validates_uniqueness_of :fullname
  #
  # def fullname
  # "#{first_name}, #{last_name}"
  # end

end
