class CreateAttendants < ActiveRecord::Migration[6.0]
  def change
    create_table :attendants, id: :serial do |t|
      t.bigint :user_id, null: false
      t.decimal :evaluation, precision: 1, scale: 1, default: 0.0
      t.integer :attendences_count, default: 0
      t.timestamps
    end

   add_foreign_key :attendants, :users, column: :user_id, primary_key: :id
  end
end
