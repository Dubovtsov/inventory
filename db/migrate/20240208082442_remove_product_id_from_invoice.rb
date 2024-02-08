class RemoveProductIdFromInvoice < ActiveRecord::Migration[7.1]
  def change
    remove_column :invoices, :product_id
  end
end
