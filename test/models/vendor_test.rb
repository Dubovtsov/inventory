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
require "test_helper"

class VendorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
