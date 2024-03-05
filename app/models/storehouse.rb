class Storehouse < ApplicationRecord
  acts_as_paranoid

  has_one_attached :image
  has_many :products
  has_many :invoices
  #has_many :product_movements, class_name: "ProductMovement", dependent: :destroy

  # нельзя удалить склад если на нем есть остатки
  # добавить чекбокс склад в архиве

  before_destroy :ensure_no_products

  private

  def ensure_no_products
    unless products.empty?
      errors.add(:base, "Сначала переместите все позиции на другой склад")
      throw(:abort)
    end
  end
end
