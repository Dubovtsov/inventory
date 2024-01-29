class AddShippedToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :shipped, :boolean, default: false
  end
end
