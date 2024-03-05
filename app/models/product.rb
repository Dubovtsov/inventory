class Product < ApplicationRecord
  extend Enumerize

  acts_as_paranoid

  has_one_attached :picture
  has_many_attached :images
  has_many :product_movements, class_name: "ProductMovement", dependent: :destroy
  has_many :invoices, through: :invoice_products

  # has_many :podcasts, through: :subscriptions, source: :subscribable, source_type: 'Podcast'
  # has_many :newspapers, through: :subscriptions, source: :subscribable, source_type: 'Newspaper'

  belongs_to :storehouse
  belongs_to :vendor
  belongs_to :client

  validates :title, presence: true
  validates :inventory_number, uniqueness: true

  enumerize :type_product, in: [ :software, :hardware, :office ], default: :hardware, i18n_scope: "type_product", scope: :shallow

  before_create :set_inventory_number
  after_create :create_product_movement

  def move_to(new_storehouse, amount)
    ActiveRecord::Base.transaction do
      product_movements.create!(from_storehouse: storehouse, to_storehouse: new_storehouse, quantity: amount, date_movement: DateTime.current.to_date)
      update!(storehouse_id: new_storehouse.id) if amount == self.amount
    end
  end

  def self.ransackable_attributes(auth_object = nil)
    ["accepted_at", "created_at", "description", "id", "id_value", "inventory_number", "serial_number", "storehouse_id", "title", "type_product", "updated_at"]
  end
  def self.ransackable_associations(auth_object = nil)
    ["storehouse"]
  end

  def add_to_invoice(invoice)
    invoice.products << self
  end

  def remove_from_invoice(invoice)
    invoice.products.delete(self)
  end

  def set_inventory_number
    if !Product.maximum(:inventory_number).present?
      self.inventory_number = 1001
    else
      last_number = Product.maximum(:inventory_number)
      if last_number.present?
        self.inventory_number = last_number.to_i + 1
      end
    end
  end

  def type_product_style
    case self.type_product
    when "office"
      "bg-sky-200 text-sky-800 border border-sky-300"
    when "hardware"
      "bg-orange-200 text-orange-800 border border-orange-300"
    when "software"
      "bg-green-200 text-green-800 border border-green-300"
    end
  end

  private

  def create_product_movement
    # Создаем новый объект ProductMovement с параметрами
    product_movements.create!(from_storehouse: Storehouse.find_by(title: "Покупка"), to_storehouse: Storehouse.find_by(id: storehouse_id), quantity: amount, date_movement: DateTime.current.to_date)
  end
end
