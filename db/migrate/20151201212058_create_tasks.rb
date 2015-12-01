class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|

      t.timestamps null: false
      t.string :name, null: false
      t.text :message, null: false
      
    end
  end
end
