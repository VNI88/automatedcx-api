class CreateUserEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :user_events, id: :serial do |t|
      t.bigint :user_id, null: false
      t.string :event
      t.datetime :started_at, default: Time.now
      t.datetime :updated_at, default: Time.now
      t.datetime :finished_at
    end

    add_foreign_key :user_events, :users, column: :user_id, primary_key: :id 
  end
end
