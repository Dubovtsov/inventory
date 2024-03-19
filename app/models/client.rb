class Client < ApplicationRecord
  has_many :products
  has_many :invoices
  validates :title, presence: true
  after_create_commit { broadcast_replace_to "new_client_form" }
end
