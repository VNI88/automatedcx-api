class AddMonitoredEventToRoutine < ActiveRecord::Migration[6.0]
  def change
    add_column :routines, :monitored_event, :string
  end
end
