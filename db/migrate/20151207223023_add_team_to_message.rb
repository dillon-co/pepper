class AddTeamToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :team, index: true, foreign_key: true
  end
end
