json.extract! price, :id, :title, :retail_price, :purchase_price, :vendor_id, :created_at, :updated_at
json.url price_url(price, format: :json)
