# frozen_string_literal: true

class AddRecipientListIdToRoutinesAndEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :recipient_list, foreign_key: true
    add_reference :routines, :recipient_list, foreign_key: true
  end
end
