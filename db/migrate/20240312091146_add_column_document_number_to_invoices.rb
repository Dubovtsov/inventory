class AddColumnDocumentNumberToInvoices < ActiveRecord::Migration[7.1]
  def change
    add_column :invoices, :document_number, :string
  end
end
