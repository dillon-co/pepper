# == Schema Information
#
# Table name: task_delegations
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  event      :string
#  event_date :datetime
#  tasks      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TaskDelegationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
