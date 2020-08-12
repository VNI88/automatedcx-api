class AddMetadataToEvents < ActiveRecord::Migration[6.0]
  def change
   add_column :events, :metadata, :jsonb, :null => false, :default => {}
  end
end
