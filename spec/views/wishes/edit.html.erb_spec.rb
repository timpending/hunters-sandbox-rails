require 'rails_helper'

RSpec.describe "wishes/edit", type: :view do
  before(:each) do
    @wish = assign(:wish, Wish.create!(
      :notes => "MyText",
      :user_id => 1,
      :product_id => 1
    ))
  end

  it "renders the edit wish form" do
    render

    assert_select "form[action=?][method=?]", wish_path(@wish), "post" do

      assert_select "textarea#wish_notes[name=?]", "wish[notes]"

      assert_select "input#wish_user_id[name=?]", "wish[user_id]"

      assert_select "input#wish_product_id[name=?]", "wish[product_id]"
    end
  end
end
