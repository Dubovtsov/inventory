# == Schema Information
#
# Table name: conrtactors
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
class Conrtactor < ApplicationRecord
  validates :name, presence: true
end
