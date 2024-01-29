class CreateStorehouses < ActiveRecord::Migration[7.1]
  def change
    create_table :storehouses do |t|
      t.string :title

      t.timestamps
    end
  end
end
