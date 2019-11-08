class Schedule < ApplicationRecord
   validates :user_id, :student_id, :date_time_start, :presence => true
   validate :dates_limit, :dow_accepted_values
   before_create :set_default_time_end
   belongs_to :teacher
   belongs_to :student
   scope :range, -> (params={}) {
       start_date = params[:start_date].nil?  ? DateTime.now.beginning_of_day : params[:start_date] 
       end_date = params[:end_date].nil? ? DateTime.now.end_of_day : params[:end_date] 
       where("date_time_start >= ? AND date_time_end <= ?", start_date, end_date )
   }

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
