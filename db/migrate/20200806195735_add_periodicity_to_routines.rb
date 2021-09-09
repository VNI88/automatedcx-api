# typed: true
class AddPeriodicityToRoutines < ActiveRecord::Migration[6.0]
  def change
    add_column :routines, :periodicity, :string, null: false
    add_column :routines, :starts_at, :datetime
  end
end
