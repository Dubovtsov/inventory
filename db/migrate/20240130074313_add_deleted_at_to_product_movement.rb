class AddDeletedAtToProductMovement < ActiveRecord::Migration[7.1]
  def change
    add_column :product_movements, :deleted_at, :datetime
    add_index :product_movements, :deleted_at
  end
end
