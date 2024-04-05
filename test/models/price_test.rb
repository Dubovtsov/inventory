# == Schema Information
#
# Table name: prices
#
#  id             :bigint           not null, primary key
#  item_number    :string
#  purchase_price :decimal(, )
#  retail_price   :decimal(, )
#  title          :string
#  vat            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  vendor_id      :bigint           not null
#
# Indexes
#
#  index_prices_on_vendor_id  (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (vendor_id => vendors.id)
#
require "test_helper"

class PriceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
