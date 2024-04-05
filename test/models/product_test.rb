# == Schema Information
#
# Table name: products
#
#  id               :bigint           not null, primary key
#  accepted_at      :date
#  amount           :integer          default(1)
#  booking          :boolean          default(FALSE)
#  deleted          :boolean          default(FALSE)
#  deleted_at       :datetime
#  description      :text
#  end_date         :date
#  inventory_number :string
#  purchase_price   :decimal(, )
#  rent             :boolean          default(FALSE)
#  retail_price     :decimal(, )
#  serial_number    :string
#  shipped          :boolean          default(FALSE)
#  title            :string
#  type_product     :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  client_id        :bigint
#  storehouse_id    :bigint           default(1), not null
#  vendor_id        :bigint
#
# Indexes
#
#  index_products_on_client_id      (client_id)
#  index_products_on_deleted_at     (deleted_at)
#  index_products_on_storehouse_id  (storehouse_id)
#  index_products_on_vendor_id      (vendor_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (storehouse_id => storehouses.id)
#  fk_rails_...  (vendor_id => vendors.id)
#
require "test_helper"

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
