class CreateContractors < ActiveRecord::Migration[7.1]
  def change
    create_table :contractors do |t|
      t.string :type
      t.string :name
      t.string :fullname
      t.string :email
      t.string :manager

      t.timestamps
    end

    change_table :products do |t|
      t.references :customer, null: true, foreign_key: { to_table: :contractors }
      t.references :supplier, null: true, foreign_key: { to_table: :contractors }
    end

    change_table :prices do |t|
      t.references :supplier, null: true, foreign_key: { to_table: :contractors }
    end

    # Изменения в таблице invoices
    change_table :invoices do |t|
      t.references :customer, null: false, foreign_key: { to_table: :contractors }
    end
  end
end
