class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :user_number
      t.string :user_name
      t.text :response_body

      t.timestamps null: false
    end
  end
end
