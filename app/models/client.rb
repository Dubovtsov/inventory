class Client < ApplicationRecord
  has_many :products
  has_many :invoices
  validates :title, presence: true
end
