json.extract! product_movement, :id, :from_storehouse_id, :to_storehouse_id, :product_id, :quantity, :date_movement, :created_at, :updated_at
json.url product_movement_url(product_movement, format: :json)
