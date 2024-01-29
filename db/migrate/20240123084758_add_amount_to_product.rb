class AddAmountToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :amount, :integer, default: 1
  end
end
