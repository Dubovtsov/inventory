# == Schema Information
#
# Table name: clients
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Client < ApplicationRecord
  has_many :products
  has_many :invoices
  validates :title, presence: true
  # after_create_commit { broadcast_replace_to "new_client_form" }
end
