# == Schema Information
#
# Table name: product_movements
#
#  id                 :bigint           not null, primary key
#  date_movement      :date
#  deleted_at         :datetime
#  quantity           :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  from_storehouse_id :bigint           not null
#  product_id         :bigint           not null
#  to_storehouse_id   :bigint           not null
#
# Indexes
#
#  index_product_movements_on_deleted_at          (deleted_at)
#  index_product_movements_on_from_storehouse_id  (from_storehouse_id)
#  index_product_movements_on_product_id          (product_id)
#  index_product_movements_on_to_storehouse_id    (to_storehouse_id)
#
# Foreign Keys
#
#  fk_rails_...  (from_storehouse_id => storehouses.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (to_storehouse_id => storehouses.id)
#
class ProductMovement < ApplicationRecord
  acts_as_paranoid

  belongs_to :from_storehouse, class_name: "Storehouse"
  belongs_to :to_storehouse, class_name: "Storehouse"
  belongs_to :product
  belongs_to :product_including_deleted,
             :class_name => "Product",
             :foreign_key => "product_id",
             :with_deleted => true

  belongs_to :from_storehouse_including_deleted,
             :class_name => "Storehouse",
             :foreign_key => "from_storehouse_id",
             :with_deleted => true

  belongs_to :to_storehouse_including_deleted,
             :class_name => "Storehouse",
             :foreign_key => "to_storehouse_id",
             :with_deleted => true
end
