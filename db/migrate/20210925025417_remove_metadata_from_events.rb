# frozen_string_literal: true

class RemoveMetadataFromEvents < ActiveRecord::Migration[6.0]
  def change
    remove_column :events, :metadata
  end
end
