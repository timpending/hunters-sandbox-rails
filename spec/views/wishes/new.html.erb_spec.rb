require 'rails_helper'

RSpec.describe "wishes/new", type: :view do
  before(:each) do
    assign(:wish, Wish.new(
      :notes => "MyText",
      :user_id => 1,
      :product_id => 1
    ))
  end

  it "renders new wish form" do
    render

    assert_select "form[action=?][method=?]", wishes_path, "post" do

      assert_select "textarea#wish_notes[name=?]", "wish[notes]"

      assert_select "input#wish_user_id[name=?]", "wish[user_id]"

      assert_select "input#wish_product_id[name=?]", "wish[product_id]"
    end
  end
end
