class Storehouse < ApplicationRecord
  acts_as_paranoid

  has_one_attached :image
  has_many :products
  has_many :invoices, as: :invoiceable
  #has_many :product_movements, class_name: "ProductMovement", dependent: :destroy

  # нельзя удалить склад если на нем есть остатки
  # добавить чекбокс склад в архиве
end
