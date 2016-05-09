# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  number       :string           not null
#  name         :string           not null
#  message      :string           not null
#  order_number :integer          default(0), not null
#  is_next      :boolean          default(FALSE)
#  girl         :boolean          default(FALSE)
#  available    :boolean          default(TRUE)
#  team_id      :integer
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
