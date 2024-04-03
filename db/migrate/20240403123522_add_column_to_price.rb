class AddColumnToPrice < ActiveRecord::Migration[7.1]
  def change
    add_column :prices, :item_number, :string
    add_column :prices, :vat, :string
  end
end
