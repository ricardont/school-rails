require 'rails_helper'

RSpec.describe "teachers/edit", type: :view do
  before(:each) do
    @teacher = assign(:teacher, Teacher.create!(
      :user_id => 1,
      :first_name => "MyText",
      :last_name => "MyText"
    ))
  end

  it "renders the edit teacher form" do
    render

    assert_select "form[action=?][method=?]", teacher_path(@teacher), "post" do

      assert_select "input[name=?]", "teacher[user_id]"

      assert_select "textarea[name=?]", "teacher[first_name]"

      assert_select "textarea[name=?]", "teacher[last_name]"
    end
  end
end
