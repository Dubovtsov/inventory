class CreatePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :prices do |t|
      t.string :title
      t.decimal :retail_price
      t.decimal :purchase_price

      t.timestamps
    end
  end
end
