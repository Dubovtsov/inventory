# == Schema Information
#
# Table name: contractors
#
#  id         :bigint           not null, primary key
#  email      :string
#  fullname   :string
#  manager    :string
#  name       :string
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Customer < Contractor
  # Специфические атрибуты для клиентов
  has_many :products
  has_many :invoices
end
