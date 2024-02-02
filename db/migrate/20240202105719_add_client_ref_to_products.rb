class AddClientRefToProducts < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :client, null: true, default: Client.first,foreign_key: true
    remove_column :products, :customer
    Product.update_all(client_id: Client.first.id)
  end
end
