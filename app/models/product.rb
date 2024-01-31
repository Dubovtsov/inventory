class Product < ApplicationRecord
  extend Enumerize

  acts_as_paranoid

  has_one_attached :picture
  has_many :product_movements, class_name: "ProductMovement", dependent: :destroy
  belongs_to :storehouse
  belongs_to :vendor

  enumerize :type_product, in: [ :software, :hardware ], default: :hardware, i18n_scope: "type_product", scope: :shallow

  after_save :create_product_movement

  def move_to(new_storehouse, amount)
    # Начинаем транзакцию
    ActiveRecord::Base.transaction do
      # Создаем новый объект ProductMovement с параметрами
      product_movements.create!(from_storehouse: storehouse, to_storehouse: new_storehouse, quantity: amount, date_movement: DateTime.current.to_date)
      # Изменяем атрибут warehouse_id продукта, если весь продукт перемещается
      update!(storehouse_id: new_storehouse.id) if amount == self.amount
    end
  end

  def create_product_movement
    # Создаем новый объект ProductMovement с параметрами
    product_movements.create!(from_storehouse: Storehouse.find_by(title: "Покупка"), to_storehouse: Storehouse.find_by(id: storehouse_id), quantity: amount, date_movement: DateTime.current.to_date)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["accepted_at", "created_at", "description", "id", "id_value", "inventory_number", "serial_number", "storehouse_id", "title", "type_product", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["storehouse"]
  end
end
