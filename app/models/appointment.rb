class Appointment < ApplicationRecord
	validates :user_id, :teacher_id, :student_id, :date_time_start, :date_time_end, :presence => true
	validate :dates_limit
	before_create :validate_dow_name, :validate_dow_number
	belongs_to 	  :teacher
	belongs_to    :student
	belongs_to    :schedule
	scope :range, -> (date_range={}) {
		start_date = date_range[:start_date].nil?  ? "#{DateTime.now.to_date} 00:00:00" : date_range[:start_date] 
		end_date   = date_range[:end_date].nil? ? "#{DateTime.now.to_date} 23:59:59" : date_range[:end_date] 
		where("date_time_start >= ? AND date_time_end <= ?", start_date, end_date)
	 }
	private 
	def validate_dow_name
		if  self.dow_name == nil 
			self.dow_name = self.date_time_start.strftime('%A')		
		end
	end
	def validate_dow_number
		if  self.dow_number == nil 
			self.dow_number = self.date_time_start.wday == 0 ? 7 : self.date_time_start.wday 
		end
	end
	def dates_limit
		if self.date_time_start.to_f > self.date_time_end.to_f
			errors.add(:date_time_start, 'Date start greater than date end')
		end
	end
end
