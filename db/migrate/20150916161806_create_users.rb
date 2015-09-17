class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

      t.timestamps null: false
      t.string :number, null: false
      t.string :name, null: false
      t.string :message, null: false
      t.integer :order_number, null: false, default: 0
      t.boolean :is_next, default: false
    end
  end
end
