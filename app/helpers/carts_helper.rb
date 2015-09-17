module CartsHelper
  def time_limit(order)
    #(order.expires_on).strftime("Purchase by: %m/%d/%Y at %I:%M%p")
    "Expires in "+distance_of_time_in_words(order.started_at, order.expires_on)
  end

  def scooby_doo
    "Ri don ro"
  end
end