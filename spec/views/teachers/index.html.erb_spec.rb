require 'rails_helper'

RSpec.describe "teachers/index", type: :view do
  before(:each) do
    assign(:teachers, [
      Teacher.create!(
        :user_id => 2,
        :first_name => "MyText",
        :last_name => "MyText"
      ),
      Teacher.create!(
        :user_id => 2,
        :first_name => "MyText",
        :last_name => "MyText"
      )
    ])
  end

  it "renders a list of teachers" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
