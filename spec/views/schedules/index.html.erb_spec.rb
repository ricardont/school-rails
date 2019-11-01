require 'rails_helper'

RSpec.describe "schedules/index", type: :view do
  before(:each) do
    assign(:schedules, [
      Schedule.create!(
        :user_id => 2,
        :student_id => 3,
        :teacher_id => 4,
        :dow_number => 5
      ),
      Schedule.create!(
        :user_id => 2,
        :student_id => 3,
        :teacher_id => 4,
        :dow_number => 5
      )
    ])
  end

  it "renders a list of schedules" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
  end
end
