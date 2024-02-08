class CreateInvoices < ActiveRecord::Migration[7.1]
  def change
    create_table :invoices do |t|
      t.references :invoiceable, polymorphic: true
      t.references :product, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
