class AddColumnToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :end_date, :date
  end
end
