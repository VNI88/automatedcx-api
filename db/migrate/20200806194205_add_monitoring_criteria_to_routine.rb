class AddMonitoringCriteriaToRoutine < ActiveRecord::Migration[6.0]
  def change
    add_column :routines, :monitoring_criteria, :string, null: false
  end
end
