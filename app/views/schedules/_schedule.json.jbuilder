json.extract! schedule, :id, :user_id, :student_id, :teacher_id, :date_time_start, :date_time_end, :dow_number, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
