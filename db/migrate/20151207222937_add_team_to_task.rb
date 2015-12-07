class AddTeamToTask < ActiveRecord::Migration
  def change
    add_reference :tasks, :team, index: true, foreign_key: true
  end
end
