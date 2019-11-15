# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Student.destroy_all
Teacher.destroy_all
Schedule.destroy_all
Appointment.destroy_all
200.times do |i|
    user_id = rand(1..3)
    name  =  Faker::Name.unique.name
    first_name = name.split(' ')[0] 
    last_name  = name.split(' ')[1] 
    age = rand(4..11)
    phone = Faker::PhoneNumber.phone_number.to_i
    address = Faker::Address.street_address
    student = Student.create!(user_id:user_id, first_name:first_name, last_name:last_name, age:age, phone:phone, address:address )
    student.save!
    if (i <= 10) 
        user_id_teacher = rand(1..3)
        name_teacher= Faker::Name.unique.name
        first_name_teacher = name_teacher.split(' ')[0]
        last_name_teacher  = name_teacher.split(' ')[1]
        teacher = Teacher.create!(user_id:user_id_teacher, first_name:first_name_teacher, last_name:last_name_teacher  )
        teacher.save!
    end
    student_id = Student.all.ids.sample
    teacher_id = Teacher.all.ids.sample
    date_time_start = Faker::Time.between_dates(from: Date.today, to: Date.today + 20, period: :afternoon).beginning_of_hour
    dow_number = rand(1..5)
    if rand(1..2) == 1
        schedule   = Schedule.create!(user_id:user_id, student_id: student_id, teacher_id: teacher_id, 
                                       date_time_start: date_time_start,  dow_number: dow_number)   
    else
        schedule = Schedule.create!(user_id:user_id, student_id: student_id, teacher_id: teacher_id, 
                                date_time_start: date_time_start  )    
    end    
    schedule.save!
    date_time_start_app = Faker::Time.between_dates(from: Date.today - 1, to: Date.today - 20, period: :afternoon).beginning_of_hour
    date_time_end_app= date_time_start_app + 3600
    attendance_flag= [true, false].sample
    types=["Evaluacion", "Diagnostico", "Terapia"]
    type=types.sample 
    appointment = Appointment.create!(
        user_id:user_id, student_id:student_id, teacher_id:teacher_id, date_time_start:date_time_start_app,
        date_time_end:date_time_end_app, attendance_flag:attendance_flag, appointment_type:type )
    appointment.save!
end 
