class ProductMovement < ApplicationRecord
  acts_as_paranoid

  belongs_to :from_storehouse, class_name: "Storehouse"
  belongs_to :to_storehouse, class_name: "Storehouse"
  belongs_to :product
  belongs_to :product_including_deleted,
             :class_name => "Product",
             :foreign_key => "product_id",
             :with_deleted => true
end
