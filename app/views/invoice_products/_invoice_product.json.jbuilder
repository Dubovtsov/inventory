json.extract! invoice_product, :id, :product_id, :invoice_id, :closed, :created_at, :updated_at
json.url invoice_product_url(invoice_product, format: :json)
