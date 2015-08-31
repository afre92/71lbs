class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
  validate :not_past_date
  validates :arrival, :departure, :overlap => {:scope => "room_id"}

    def not_past_date
      # byebug
      if self.arrival < Date.today
        errors.add(:date, 'it has to be from today')
      end
      if self.departure < Date.tomorrow
        errors.add(:date, 'cannot be today')
      end
    end

end
