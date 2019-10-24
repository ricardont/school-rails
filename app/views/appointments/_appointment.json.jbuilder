json.extract! appointment, :id, :user_id, :student_id, :teacher_id, :date_time_start, :date_time_end, :dow_name, :dow_number, :enabled, :attendance_flag, :type, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
