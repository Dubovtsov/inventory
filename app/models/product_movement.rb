class ProductMovement < ApplicationRecord
  belongs_to :from_storehouse, class_name: "Storehouse"
  belongs_to :to_storehouse, class_name: "Storehouse"
  belongs_to :product
end
