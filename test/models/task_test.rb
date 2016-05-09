# == Schema Information
#
# Table name: tasks
#
#  id           :integer          not null, primary key
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  name         :string           not null
#  message      :text             not null
#  time         :string           not null
#  day_of_week  :integer          default(1)
#  day_of_month :integer          default(1)
#  enabled      :boolean          default(TRUE)
#  cron_time    :string
#  team_id      :integer
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
