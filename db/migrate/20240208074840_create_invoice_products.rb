class CreateInvoiceProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :invoice_products do |t|
      t.references :product, null: false, foreign_key: true
      t.references :invoice, null: false, foreign_key: true
      t.boolean :closed

      t.timestamps
    end
  end
end
