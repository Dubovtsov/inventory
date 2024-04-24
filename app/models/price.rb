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
class Price < ApplicationRecord
  extend Enumerize
  belongs_to :vendor

  enumerize :vat, in: [ :vat_20, :no_vat ], default: :no_vat, i18n_scope: "vat", scope: :shallow

  require 'csv'
    def self.to_csv
    prices = all
    CSV.generate do |csv|
      csv << column_names
      prices.each do |price|
        csv << price.attributes.values_at(*column_names)
      end
    end
  end

  def discount_percentage
    discount_amount = self.retail_price - self.purchase_price
    discount_percentage = (discount_amount / retail_price.to_f) * 100
    discount_percentage.round(2)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "purchase_price", "retail_price", "title", "updated_at", "vendor_id"]
  end
end
