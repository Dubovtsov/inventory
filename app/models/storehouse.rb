class Storehouse < ApplicationRecord
  has_one_attached :image
  has_many :products

  # нельзя удалить склад если на нем есть остатки
  # добавить чекбокс склад в архиве
end
