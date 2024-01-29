class AddEmployeeToStorehouse < ActiveRecord::Migration[7.1]
  def change
    add_column :storehouses, :employee, :boolean, default: false
  end
end
