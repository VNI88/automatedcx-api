# typed: true
class AddCreatedAtColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :routines, :created_at, :datetime
    add_column :events, :created_at, :datetime
  end
end
