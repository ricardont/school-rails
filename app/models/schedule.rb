class Schedule < ApplicationRecord
   validates :user_id, :teacher_id, :student_id, :date_time_start, :presence => true
   validate :dates_limit, :dow_accepted_values
   before_create :set_default_time_end
   private
   def dates_limit
	  if self.date_time_end != nil && self.date_time_start.to_f > self.date_time_end.to_f
		  errors.add(:date_time_start, 'Date start greater than date end')
	  end
   end
   def set_default_time_end
      if self.date_time_end ==  nil
        self.date_time_end = self.date_time_start + 3600
      end
   end
   def dow_accepted_values
	  unless [1,2,3,4,5,6,7,nil].include?(self.dow_number)
		  errors.add(:dow_number, 'Day of week number out of range (1-7)')
	  end
   end
end
