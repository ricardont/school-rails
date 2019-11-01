require 'rails_helper'
RSpec.describe Appointment, type: :model do
	describe "Creating an appointment " do
		it 'restrict to save if user, teacher or student  are not present' do 
			Appointment.create(date_time_start:"2019-05-05 13:00:00", 
			date_time_end:"2019-05-05 14:00:00",
			dow_name:"Monday", dow_number:1).save
			expect(Appointment.count).to eq(0) 	
		end
		it 'restrict save without day of week or date' do
			Appointment.create(user_id:1, 
			student_id:1,
			teacher_id:2,
			dow_name:"Monday", dow_number:1).save
			expect(Appointment.count).to eq(0)
		end
		it 'dow  must correspond to date' do
			Appointment.create(
		    user_id:1,
			student_id:1,
			teacher_id:2,
			date_time_start:"2019-05-05 13:00:00", 
			date_time_end:"2019-05-05 14:00:00").save
			a =  Appointment.first
			expect(a.dow_name).to eq("Sunday")
			expect(a.dow_number).to eq(7)
		end
		it 'end date time must be greater than start date time' do
			date_time_start = "2019-05-05 14:00:00"
			date_time_end   = "2019-05-05 13:00:00"
			Appointment.create(
		    user_id:1,
			student_id:1,
			teacher_id:2,
			date_time_start:date_time_start, 
			date_time_end:date_time_end ).save
			expect(Appointment.count).to eq(0)	
		end
	end
end


