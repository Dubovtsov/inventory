class Vendor < ApplicationRecord
  has_many :products
  has_many :price
end
