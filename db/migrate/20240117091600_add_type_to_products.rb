class AddTypeToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :type_product, :string
  end
end
