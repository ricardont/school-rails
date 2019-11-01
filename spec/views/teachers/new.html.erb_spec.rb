require 'rails_helper'

RSpec.describe "teachers/new", type: :view do
  before(:each) do
    assign(:teacher, Teacher.new(
      :user_id => 1,
      :first_name => "MyText",
      :last_name => "MyText"
    ))
  end

  it "renders new teacher form" do
    render

    assert_select "form[action=?][method=?]", teachers_path, "post" do

      assert_select "input[name=?]", "teacher[user_id]"

      assert_select "textarea[name=?]", "teacher[first_name]"

      assert_select "textarea[name=?]", "teacher[last_name]"
    end
  end
end
