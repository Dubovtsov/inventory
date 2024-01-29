class Price < ApplicationRecord
  belongs_to :vendor

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

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "purchase_price", "retail_price", "title", "updated_at", "vendor_id"]
  end
end
