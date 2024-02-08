class Invoice < ApplicationRecord
  belongs_to :invoiceable, polymorphic: true
  has_many :invoice_products
  has_many :products, through: :invoice_products

  def add_product(product)
    self.products << product
  end
end
