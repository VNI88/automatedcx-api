# typed: true
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :serial do |t|
      t.string :name
      t.string :email, null: false
      t.string :password, null: false, limit: 8
      t.string :api_key, null: false, limit: 20
      t.string :role, null: false
      t.timestamps
    end

    add_index :users, :id
  end
end
