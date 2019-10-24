require "application_system_test_case"

class AppointmentsTest < ApplicationSystemTestCase
  setup do
    @appointment = appointments(:one)
  end

  test "visiting the index" do
    visit appointments_url
    assert_selector "h1", text: "Appointments"
  end

  test "creating a Appointment" do
    visit appointments_url
    click_on "New Appointment"

    check "Attendance flag" if @appointment.attendance_flag
    fill_in "Date time end", with: @appointment.date_time_end
    fill_in "Date time start", with: @appointment.date_time_start
    fill_in "Dow name", with: @appointment.dow_name
    fill_in "Dow number", with: @appointment.dow_number
    check "Enabled" if @appointment.enabled
    fill_in "Student", with: @appointment.student_id
    fill_in "Teacher", with: @appointment.teacher_id
    fill_in "Type", with: @appointment.type
    fill_in "User", with: @appointment.user_id
    click_on "Create Appointment"

    assert_text "Appointment was successfully created"
    click_on "Back"
  end

  test "updating a Appointment" do
    visit appointments_url
    click_on "Edit", match: :first

    check "Attendance flag" if @appointment.attendance_flag
    fill_in "Date time end", with: @appointment.date_time_end
    fill_in "Date time start", with: @appointment.date_time_start
    fill_in "Dow name", with: @appointment.dow_name
    fill_in "Dow number", with: @appointment.dow_number
    check "Enabled" if @appointment.enabled
    fill_in "Student", with: @appointment.student_id
    fill_in "Teacher", with: @appointment.teacher_id
    fill_in "Type", with: @appointment.type
    fill_in "User", with: @appointment.user_id
    click_on "Update Appointment"

    assert_text "Appointment was successfully updated"
    click_on "Back"
  end

  test "destroying a Appointment" do
    visit appointments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Appointment was successfully destroyed"
  end
end
