class Order < ActiveRecord::Base
  attr_accessor :product_id

  belongs_to :order_status
  has_one :product
end
