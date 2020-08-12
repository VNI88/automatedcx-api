class AddColumnsToUserEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_events, :event
    remove_column :user_events, :updated_at
    add_column :user_events, :name, :string, null: false
    add_column :user_events, :category, :string, null: false
  end
end
