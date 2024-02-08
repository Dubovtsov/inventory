class Client < ApplicationRecord
  has_many :products
  has_many :invoices, as: :invoiceable
  validates :title, presence: true
end
