# == Schema Information
#
# Table name: vendors
#
#  id         :bigint           not null, primary key
#  manager    :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Vendor < ApplicationRecord
  has_many :products
  has_many :price
end
