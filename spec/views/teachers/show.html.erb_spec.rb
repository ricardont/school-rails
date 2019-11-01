require 'rails_helper'

RSpec.describe "teachers/show", type: :view do
  before(:each) do
    @teacher = assign(:teacher, Teacher.create!(
      :user_id => 2,
      :first_name => "MyText",
      :last_name => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
