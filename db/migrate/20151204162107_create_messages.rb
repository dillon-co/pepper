class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|

      t.timestamps null: false
      t.string :message, null: false
      
    end
  end
end
