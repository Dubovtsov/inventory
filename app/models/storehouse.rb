# == Schema Information
#
# Table name: storehouses
#
#  id          :bigint           not null, primary key
#  deleted_at  :datetime
#  description :text
#  employee    :boolean          default(FALSE)
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_storehouses_on_deleted_at  (deleted_at)
#
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
