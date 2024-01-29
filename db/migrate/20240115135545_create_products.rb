class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.string :serial_number
      t.string :inventory_number
      t.date :accepted_at

      t.timestamps
    end
  end
end
