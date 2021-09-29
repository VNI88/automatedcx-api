# frozen_string_literal: true

class AddMessageSenderIdToRoutinesAndEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :message_sender, foreign_key: true
    add_reference :routines, :message_sender, foreign_key: true
  end
end
