# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Cart < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :prices, through: :cart_items

  def total_retail_price
    cart_items.sum(&:total_retail_price)
  end
  def total_purchase_price
    cart_items.sum(&:total_purchase_price)
  end
end
