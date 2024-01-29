class CreateProductMovements < ActiveRecord::Migration[7.1]
  def change
    create_table :product_movements do |t|
      t.references :from_storehouse, null: false, foreign_key: { to_table: :storehouses }
      t.references :to_storehouse, null: false, foreign_key: { to_table: :storehouses }
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false
      t.date :date_movement

      t.timestamps
    end
  end
end
