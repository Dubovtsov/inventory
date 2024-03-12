class AddColumnCompletedToInvoices < ActiveRecord::Migration[7.1]
  def change
    add_column :invoices, :completed, :boolean, default: false
  end
end
