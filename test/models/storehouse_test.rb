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
require "test_helper"

class StorehouseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
