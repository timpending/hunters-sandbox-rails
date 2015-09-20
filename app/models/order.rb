class Order < ActiveRecord::Base
  attr_accessor :product_id

  belongs_to :order_status
  belongs_to :user

  has_one :product
  after_save :remove_expired_items

  def expired?
    Time.now > self.expires_on
  end

  def expires_on
    self.started_at + 6.hours
  end

  private

  def remove_expired_items
    self.user.orders.each do |order|
      if order.expired?
        order.destroy
        prod = order.product
        prod.order_id = nil
        prod.save
      end
    end
  end


end
