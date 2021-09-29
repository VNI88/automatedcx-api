# typed: true
class AddDefaultStatusOnRoutine < ActiveRecord::Migration[6.0]
  def change
    change_column_default :routines, :status, 'unscheduled'
  end
end
