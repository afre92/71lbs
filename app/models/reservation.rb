class Reservation < ActiveRecord::Base
  belongs_to :user
  has_many :rooms
  # validate :not_past_date

    # def not_past_date
    #   if self.date < Date.today
    #     errors.add(:date, 'not in past')
    #   end
    # end
end
