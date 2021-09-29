# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications, id: :serial do |t|
      t.bigint :company_id, null: false
      t.string :message, null: false
      t.string :status, null: false, default: :unpublished
      t.datetime :created_at, default: Time.zone.now
      t.datetime :updated_at, default: Time.zone.now
    end

    add_foreign_key :notifications, :companies, column: :company_id, primary_key: :id
  end
end
