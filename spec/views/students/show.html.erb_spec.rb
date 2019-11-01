require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :user_id => 2,
      :first_name => "MyText",
      :last_name => "MyText",
      :age => 3,
      :phone => 4,
      :address => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
  end
end
