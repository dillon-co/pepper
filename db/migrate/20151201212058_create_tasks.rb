class CreateTasks < ActiveRecord::Migration

  def change
    create_table :tasks do |t|

      t.timestamps null: false
      t.string :name, null: false
      t.text :message, null: false
      t.string :time, null: false
      t.integer :day_of_week, default: 1
      t.integer :day_of_month, default: 1
      t.boolean :enabled, default: true
      t.string :cron_time
    end
  end
end
