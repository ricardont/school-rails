require 'rails_helper'

RSpec.describe Schedule, type: :model do
  describe "Creating an Schedule " do
    it 'restrict to save if user, teacher or student  are not present' do 
			Schedule.create(date_time_start:"2019-05-05 13:00:00", 
			date_time_end:"2019-05-05 14:00:00").save
			expect(Schedule.count).to eq(0) 	
		end
    it 'end date time must be greater than start date time' do
      date_time_start = "2019-05-05 14:00:00"
      date_time_end   = "2019-05-05 13:00:00"
      Schedule.create(
        user_id:1,
        student_id:1,
        teacher_id:2,
        date_time_start:date_time_start, 
        date_time_end:date_time_end ).save
      expect(Schedule.count).to eq(0)	
    end
    it 'If end date/time not provided, set one hour after by default' do
      date_time_start = "2019-05-05 14:00:00"
      Schedule.create(
        user_id:1,
        student_id:1,
        teacher_id:2,
        date_time_start:date_time_start ).save
      date_time_end = Schedule.first.date_time_end
      expect(date_time_end).to eq("2019-05-05 15:00:00")	
    end
    it 'Dow number only must be from 1 to 7, error' do
      date_time_start = "2019-05-05 14:00:00"
      Schedule.create(
        user_id:1,
        student_id:1,
        teacher_id:2,
        date_time_start:date_time_start,
        dow_number:8 ).save
      Schedule.create(
          user_id:1,
          student_id:1,
          teacher_id:2,
          date_time_start:date_time_start,
          dow_number:0 ).save
          expect(Schedule.count).to eq(0)    
    end
    it 'Dow number only must be from 1 to 7, success' do
      date_time_start = "2019-05-05 14:00:00"
      Schedule.create(
        user_id:1,
        student_id:1,
        teacher_id:2,
        date_time_start:date_time_start,
        dow_number:7 ).save
      Schedule.create(
          user_id:1,
          student_id:1,
          teacher_id:2,
          date_time_start:date_time_start,
          dow_number:3 ).save
      expect(Schedule.count).to eq(2)    
    end
  end
end