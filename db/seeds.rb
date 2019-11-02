# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |i|
    user_id = rand(1..3)
    first_name = Faker::Name.unique.name 
    last_name = Faker::Name.unique.name 
    age = rand(4..11)
    phone = Faker::PhoneNumber
    address = Faker::Address
    student = Student.create!(user_id:user_id, first_name:first_name, last_name:last_name, age:age, phone:phone, address:address )
    student.save!
    if (i <= 10) 
        user_id_teacher = rand(1..3)
        first_name_teacher= Faker::Name.unique.name
        last_name_teacher= Faker::Name.unique.name
        teacher = Teacher.create!(user_id:user_id_teacher, first_name:first_name_teacher, last_name:last_name_teacher  )
        teacher.save!
    end
    student_id =  Student.all().ids.sample(1 + Student.count)
    teacher_id =  Teacher.all().ids.sample(1 + Teacher.count)
    date_time_start = Faker::Time.between(from: DateTime.now + 1, to: DateTime.now + 20 , format: :default)
    dow_number = rand(1..5)
    schedule = Schedule.create!(user_id:user_id, student_id: student_id, teacher_id: teacher_id, date_time_start: date_time_start  dow_number: dow_number)         
    schedule.save!
    # date_time_start_app=Faker::Time.between(from: DateTime.now - 1, to: DateTime.now - 20 , format: :default)
    # date_time_end_app= date_time_start_app + 3600
    # attendance_flag= [true, false].sample
    # types=["Evaluacion", "Diagnostico", "Terapia"].sample(1 + rand(my_array.count))
    # type=types.sample(1 + rand(types.count)) 
    # appointment = Appointment.create!(
    #     user_id:user_id, student_id:student_id,
    #     teacher_id:teacher_id, date_time_start:date_time_start_app,
    #     date_time_end:date_time_end_app,dow_name:dow_name, 
    #     dow_number:dow_number, enabled:enabled, 
    #     attendance_flag:attendance_flag, attendance_type:type )
    # appointment.save!
end 
Student.destroy_all
Teacher.destroy_all
Schedule.destroy_all
Appointment.destroy_all