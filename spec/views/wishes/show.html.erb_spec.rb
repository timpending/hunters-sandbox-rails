require 'rails_helper'

RSpec.describe "wishes/show", type: :view do
  before(:each) do
    @wish = assign(:wish, Wish.create!(
      :notes => "MyText",
      :user_id => 1,
      :product_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
  end
end
