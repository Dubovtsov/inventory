# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  cart_id    :bigint           not null
#  price_id   :bigint           not null
#
# Indexes
#
#  index_cart_items_on_cart_id   (cart_id)
#  index_cart_items_on_price_id  (price_id)
#
# Foreign Keys
#
#  fk_rails_...  (cart_id => carts.id)
#  fk_rails_...  (price_id => prices.id)
#
class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :price

  def total_retail_price
    quantity * price.retail_price
  end

  def total_purchase_price
    quantity * price.purchase_price
  end
end
