require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :user_id => 1,
      :first_name => "MyText",
      :last_name => "MyText",
      :age => 1,
      :phone => 1,
      :address => "MyText"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input[name=?]", "student[user_id]"

      assert_select "textarea[name=?]", "student[first_name]"

      assert_select "textarea[name=?]", "student[last_name]"

      assert_select "input[name=?]", "student[age]"

      assert_select "input[name=?]", "student[phone]"

      assert_select "textarea[name=?]", "student[address]"
    end
  end
end
