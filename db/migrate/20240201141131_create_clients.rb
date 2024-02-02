class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :title

      t.timestamps
    end
    Client.create!(title: "неизвестно")
  end
end
