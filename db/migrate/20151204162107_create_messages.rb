class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.timestamps null: false
      t.string :message, null: false
      t.text :specific_users, default: 'all'
      
    end
  end
end
