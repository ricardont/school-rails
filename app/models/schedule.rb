class Schedule < ApplicationRecord
   validates :user_id, :student_id, :date_time_start, :presence => true
   validate :dates_limit, :dow_accepted_values
   before_create :set_default_time_end, :set_date_zero
   belongs_to :teacher
   belongs_to :student
   scope :range, -> (date_range={}) {
      start_date = date_range[:start_date].nil?  ? DateTime.now.beginning_of_day : date_range[:start_date] 
      end_date   = date_range[:end_date].nil? ? DateTime.now.end_of_day : date_range[:end_date] 
      wday_nums  = (start_date.to_date .. end_date.to_date).map { |d|
         d.to_date.wday == 0 ? 7 : d.to_date.wday
      }    
      where("date_time_start >= ? AND date_time_end <= ? OR dow_number in (?)", start_date, end_date, wday_nums)
   }
   private
   def set_date_zero
      unless [1..7,nil].include?(self.dow_number)
         self.date_time_start = "0001-01-01 #{date_time_start.strftime("%H:%M:%S")}"
      end
   end
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
