class AddPriceToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :retail_price, :decimal
    add_column :products, :purchase_price, :decimal
  end
end
