class CreateTaskDelegations < ActiveRecord::Migration
  def change
    create_table :task_delegations do |t|
      t.belongs_to :team, index: true
      t.string :event
      t.datetime :event_date
      t.text :tasks

      t.timestamps null: false
    end
  end
end
