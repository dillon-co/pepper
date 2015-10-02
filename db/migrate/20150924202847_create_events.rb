class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|

      t.timestamps null: false
      t.datetime :date, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.text :supplies, null: false
    end
  end
end
