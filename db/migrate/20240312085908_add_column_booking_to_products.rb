class AddColumnBookingToProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :booking, :boolean, default: false
  end
end
