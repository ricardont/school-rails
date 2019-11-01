require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :user_id => 2,
        :first_name => "MyText",
        :last_name => "MyText",
        :age => 3,
        :phone => 4,
        :address => "MyText"
      ),
      Student.create!(
        :user_id => 2,
        :first_name => "MyText",
        :last_name => "MyText",
        :age => 3,
        :phone => 4,
        :address => "MyText"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
