class AddRentToProduct < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :rent, :boolean, default: false
  end
end
