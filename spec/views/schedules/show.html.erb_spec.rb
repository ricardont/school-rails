require 'rails_helper'

RSpec.describe "schedules/show", type: :view do
  before(:each) do
    @schedule = assign(:schedule, Schedule.create!(
      :user_id => 2,
      :student_id => 3,
      :teacher_id => 4,
      :dow_number => 5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
  end
end
