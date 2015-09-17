require 'rails_helper'

RSpec.describe "wishes/index", type: :view do
  before(:each) do
    assign(:wishes, [
      Wish.create!(
        :notes => "MyText",
        :user_id => 1,
        :product_id => 2
      ),
      Wish.create!(
        :notes => "MyText",
        :user_id => 1,
        :product_id => 2
      )
    ])
  end

  it "renders a list of wishes" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
