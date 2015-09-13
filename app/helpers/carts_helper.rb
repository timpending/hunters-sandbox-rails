module CartsHelper
  def time_limit(order)
    (order.started_at + 12.hours).strftime("Purchase by: %m/%d/%Y at %I:%M%p")
  end
end