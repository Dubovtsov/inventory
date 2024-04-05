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
#  client_id       :bigint           not null
#  storehouse_id   :bigint           not null
#  user_id         :bigint           not null
#
# Indexes
#
#  index_invoices_on_client_id      (client_id)
#  index_invoices_on_storehouse_id  (storehouse_id)
#  index_invoices_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (client_id => clients.id)
#  fk_rails_...  (storehouse_id => storehouses.id)
#  fk_rails_...  (user_id => users.id)
#
require "test_helper"

class InvoiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
