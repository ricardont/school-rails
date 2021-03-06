# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_11_25_061215) do

  create_table "appointments", force: :cascade do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "date_time_start"
    t.datetime "date_time_end"
    t.string "dow_name"
    t.integer "dow_number"
    t.boolean "enabled"
    t.boolean "attendance_flag"
    t.string "appointment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "schedule_id"
    t.text "notes"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "user_id"
    t.integer "student_id"
    t.integer "teacher_id"
    t.datetime "date_time_start"
    t.datetime "date_time_end"
    t.integer "dow_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "appointment_type"
    t.text "notes"
    t.boolean "enabled"
  end

  create_table "students", force: :cascade do |t|
    t.integer "user_id"
    t.text "first_name"
    t.text "last_name"
    t.integer "age"
    t.integer "phone"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.integer "user_id"
    t.text "first_name"
    t.text "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
