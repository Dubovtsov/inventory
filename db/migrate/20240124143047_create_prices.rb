class CreatePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :prices do |t|
      t.string :title
      t.decimal :retail_price
      t.decimal :purchase_price
      t.references :vendor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
