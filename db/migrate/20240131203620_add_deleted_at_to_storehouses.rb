class AddDeletedAtToStorehouses < ActiveRecord::Migration[7.1]
  def change
    add_column :storehouses, :deleted_at, :datetime
    add_index :storehouses, :deleted_at
  end
end
