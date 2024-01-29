class AddProductRefToStorehouses < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :storehouse, null: true, foreign_key: true
  end
end
