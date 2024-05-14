# == Schema Information
#
# Table name: invoices
#
#  id              :bigint           not null, primary key
#  completed       :boolean          default(FALSE)
#  date            :datetime
#  document_number :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  customer_id     :bigint           not null
#  storehouse_id   :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_invoices_on_customer_id    (customer_id)
#  index_invoices_on_storehouse_id  (storehouse_id)
#  index_invoices_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (customer_id => contractors.id)
#  fk_rails_...  (storehouse_id => storehouses.id)
#  fk_rails_...  (user_id => users.id)
#
class Invoice < ApplicationRecord
  # belongs_to :invoiceable, polymorphic: true
  has_many :invoice_products, dependent: :destroy
  has_many :products, through: :invoice_products
  belongs_to :user
  # belongs_to :client
  belongs_to :customer
  belongs_to :storehouse

  scope :completed, -> { where(completed: true)}
  scope :uncompleted, -> { where(completed: false)}

  after_update_commit -> { broadcast_replace_to "products" }
end
