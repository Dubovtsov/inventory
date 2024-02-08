json.extract! invoice, :id, :invoiceable_id, :product_id, :date, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
