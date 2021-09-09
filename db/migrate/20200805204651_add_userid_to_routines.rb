# typed: true
class AddUseridToRoutines < ActiveRecord::Migration[6.0]
  def change
    add_column :routines, :user_id, :bigint
    add_foreign_key :routines, :users, column: :user_id, primary_key: :id
  end
end
