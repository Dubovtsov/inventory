class AddColumnToProduct < ActiveRecord::Migration[7.1]
  def change
    add_reference :products, :vendor, null: true, foreign_key: true
    add_column :products, :end_date, :date
    add_column :products, :customer, :string
  end
end
