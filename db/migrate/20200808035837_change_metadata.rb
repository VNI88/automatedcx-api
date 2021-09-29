# typed: true
class ChangeMetadata < ActiveRecord::Migration[6.0]
  def change
    change_column_null :events, :metadata, true
  end
end
