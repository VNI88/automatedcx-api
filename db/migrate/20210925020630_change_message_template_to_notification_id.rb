# frozen_string_literal: true

class ChangeMessageTemplateToNotificationId < ActiveRecord::Migration[6.0]
  def change
    remove_column :routines, :message_template
    add_column :routines, :notification_id, :bigint
    add_foreign_key :routines, :notifications, column: :notification_id, primary_key: :id
  end
end
