# == Schema Information
#
# Table name: employees
#
#  id          :bigint           not null, primary key
#  first_name  :string
#  last_name   :string
#  middle_name :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Employee < ApplicationRecord
  has_many :products
end
