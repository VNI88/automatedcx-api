# typed: true
class RenameUserEventsToEvents < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_events, :events
  end
end
