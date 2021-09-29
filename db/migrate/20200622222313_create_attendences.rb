# typed: false
class CreateAttendences < ActiveRecord::Migration[6.0]
  def change
    create_table :attendences, id: :serial do |t|
      t.bigint :attendant_id, null: false
      t.integer :interactions_count, default: 0
      t.jsonb :client_data
      t.datetime :started_at, default: Time.now
      t.datetime :updated_at, default: Time.now
      t.datetime :finished_at
    end

    add_foreign_key :attendences, :attendants, column: :attendant_id, primary_key: :id
  end
end
