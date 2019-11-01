require 'rails_helper'

RSpec.describe "schedules/new", type: :view do
  before(:each) do
    assign(:schedule, Schedule.new(
      :user_id => 1,
      :student_id => 1,
      :teacher_id => 1,
      :dow_number => 1
    ))
  end

  it "renders new schedule form" do
    render

    assert_select "form[action=?][method=?]", schedules_path, "post" do

      assert_select "input[name=?]", "schedule[user_id]"

      assert_select "input[name=?]", "schedule[student_id]"

      assert_select "input[name=?]", "schedule[teacher_id]"

      assert_select "input[name=?]", "schedule[dow_number]"
    end
  end
end
