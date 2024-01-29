json.extract! product, :id, :title, :description, :serial_number, :inventory_number, :accepted_at, :created_at, :updated_at
json.url product_url(product, format: :json)
