json.array!(@wishes) do |wish|
  json.extract! wish, :id, :notes, :user_id, :product_id
  json.url wish_url(wish, format: :json)
end
