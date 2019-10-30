json.extract! student, :id, :user_id, :first_name, :last_name, :age, :phone, :address, :created_at, :updated_at
json.url student_url(student, format: :json)
