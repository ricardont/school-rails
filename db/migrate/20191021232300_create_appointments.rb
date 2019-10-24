class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.integer :user_id
      t.integer :student_id
      t.integer :teacher_id
      t.datetime :date_time_start
      t.datetime :date_time_end
      t.string :dow_name
      t.integer :dow_number
      t.boolean :enabled
      t.boolean :attendance_flag
      t.string :type

      t.timestamps
    end
  end
end
