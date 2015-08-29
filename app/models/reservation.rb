class Reservation < ActiveRecord::Base
  belongs_to :user
  belongs_to :room
   validate :not_past_date

    def not_past_date
      # byebug
      if self.from < Date.today
        errors.add(:date, 'it has to be from today')
      end
      if self.to < Date.tomorrow
        errors.add(:date, 'cannot be today')
      end
    end

end
