class Appointment < ApplicationRecord
	validates :user_id, :teacher_id, :student_id, :date_time_start, :date_time_end, :presence => true
	before_create :validate_dow_name, :validate_dow_number
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
end
