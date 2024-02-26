class Invoice < ApplicationRecord
  # belongs_to :invoiceable, polymorphic: true
  has_many :invoice_products, dependent: :destroy
  has_many :products, through: :invoice_products
  belongs_to :user
  belongs_to :client
  belongs_to :storehouse
  after_update_commit -> { broadcast_replace_to "products" }
end
