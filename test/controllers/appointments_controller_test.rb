require 'test_helper'

class AppointmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @appointment = appointments(:one)
  end

  test "should get index" do
    get appointments_url
    assert_response :success
  end

  test "should get new" do
    get new_appointment_url
    assert_response :success
  end

  test "should create appointment" do
    assert_difference('Appointment.count') do
      post appointments_url, params: { appointment: { attendance_flag: @appointment.attendance_flag, date_time_end: @appointment.date_time_end, date_time_start: @appointment.date_time_start, dow_name: @appointment.dow_name, dow_number: @appointment.dow_number, enabled: @appointment.enabled, student_id: @appointment.student_id, teacher_id: @appointment.teacher_id, type: @appointment.type, user_id: @appointment.user_id } }
    end

    assert_redirected_to appointment_url(Appointment.last)
  end

  test "should show appointment" do
    get appointment_url(@appointment)
    assert_response :success
  end

  test "should get edit" do
    get edit_appointment_url(@appointment)
    assert_response :success
  end

  test "should update appointment" do
    patch appointment_url(@appointment), params: { appointment: { attendance_flag: @appointment.attendance_flag, date_time_end: @appointment.date_time_end, date_time_start: @appointment.date_time_start, dow_name: @appointment.dow_name, dow_number: @appointment.dow_number, enabled: @appointment.enabled, student_id: @appointment.student_id, teacher_id: @appointment.teacher_id, type: @appointment.type, user_id: @appointment.user_id } }
    assert_redirected_to appointment_url(@appointment)
  end

  test "should destroy appointment" do
    assert_difference('Appointment.count', -1) do
      delete appointment_url(@appointment)
    end

    assert_redirected_to appointments_url
  end
end
