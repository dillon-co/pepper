# == Schema Information
#
# Table name: teams
#
#  id                      :integer          not null, primary key
#  email                   :string           default(""), not null
#  encrypted_password      :string           default(""), not null
#  reset_password_token    :string
#  reset_password_sent_at  :datetime
#  remember_created_at     :datetime
#  sign_in_count           :integer          default(0), not null
#  current_sign_in_at      :datetime
#  last_sign_in_at         :datetime
#  current_sign_in_ip      :inet
#  last_sign_in_ip         :inet
#  weekly_reminder_enabled :boolean          default(FALSE)
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Team < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :users
  has_many :tasks
  has_many :task_delegations
  has_many :messages
  has_many :events
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
