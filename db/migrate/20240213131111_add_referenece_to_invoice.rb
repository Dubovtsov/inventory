class AddRefereneceToInvoice < ActiveRecord::Migration[7.1]
  def change
    add_reference :invoices, :storehouse, null: false, foreign_key: true
    add_reference :invoices, :user, null: false, foreign_key: true
    remove_reference :invoices, :invoiceable, polymorphic: true
  end
end
