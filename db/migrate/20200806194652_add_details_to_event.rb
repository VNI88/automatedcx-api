# typed: true
class AddDetailsToEvent < ActiveRecord::Migration[6.0]
  def change
    add_column :events, :previous_event_id, :bigint
    add_column :events, :previous_event_name, :string,default: 'no_previous_event'
    add_column :events, :next_event_name, :string, default: 'no_next_event'
  end
end
