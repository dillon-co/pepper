class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.timestamps null: false
      t.string :name, null: false
      t.text :message, null: false
      t.string :time, null: false
      t.string :cron_time, null: false
    end
  end
end
