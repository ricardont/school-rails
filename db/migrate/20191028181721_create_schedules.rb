class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.integer :user_id
      t.integer :student_id
      t.integer :teacher_id
      t.datetime :date_time_start
      t.datetime :date_time_end
      t.integer :dow_number

      t.timestamps
    end
  end
end
