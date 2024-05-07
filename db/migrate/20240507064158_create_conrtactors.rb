class CreateConrtactors < ActiveRecord::Migration[7.1]
  def change
    create_table :conrtactors do |t|
      t.string :type
      t.string :name
      t.string :fullname
      t.string :email
      t.string :manager

      t.timestamps
    end
  end
end
