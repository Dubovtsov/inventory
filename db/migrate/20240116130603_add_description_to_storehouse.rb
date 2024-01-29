class AddDescriptionToStorehouse < ActiveRecord::Migration[7.1]
  def change
    add_column :storehouses, :description, :text
  end
end
