json.array!(@products) do |product|
  json.extract! product, :id, :name, :pdate, :active_status, :sort
  json.url product_url(product, format: :json)
end
