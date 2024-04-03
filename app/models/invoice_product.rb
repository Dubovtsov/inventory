# == Schema Information
#
# Table name: invoice_products
#
#  id         :bigint           not null, primary key
#  closed     :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  invoice_id :bigint           not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_invoice_products_on_invoice_id  (invoice_id)
#  index_invoice_products_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (invoice_id => invoices.id)
#  fk_rails_...  (product_id => products.id)
#
class InvoiceProduct < ApplicationRecord
  belongs_to :product
  belongs_to :invoice
end
