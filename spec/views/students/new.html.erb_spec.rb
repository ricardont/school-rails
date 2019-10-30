require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :user_id => 1,
      :first_name => "MyText",
      :last_name => "MyText",
      :age => 1,
      :phone => 1,
      :address => "MyText"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[user_id]"

      assert_select "textarea[name=?]", "student[first_name]"

      assert_select "textarea[name=?]", "student[last_name]"

      assert_select "input[name=?]", "student[age]"

      assert_select "input[name=?]", "student[phone]"

      assert_select "textarea[name=?]", "student[address]"
    end
  end
end
