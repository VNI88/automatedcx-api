# typed: true
class UpdateStartsAt < ActiveRecord::Migration[6.0]
  def change
    change_column :routines, :starts_at, :timestamp
  end
end
