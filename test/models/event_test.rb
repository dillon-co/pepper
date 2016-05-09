# == Schema Information
#
# Table name: events
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date        :datetime         not null
#  title       :string           not null
#  description :text             not null
#  supplies    :text             not null
#  team_id     :integer
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
