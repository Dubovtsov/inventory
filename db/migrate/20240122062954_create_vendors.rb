class CreateVendors < ActiveRecord::Migration[7.1]
  def change
    create_table :vendors do |t|
      t.string :title
      t.string :manager

      t.timestamps
    end
  end
end
