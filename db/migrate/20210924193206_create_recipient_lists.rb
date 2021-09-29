# frozen_string_literal: true

class CreateRecipientLists < ActiveRecord::Migration[6.0]
  def change
    create_table :recipient_lists, id: :serial do |t|
      t.bigint :company_id, null: false
      t.string :type, null: true
      t.jsonb :list, null: false, default: {}
      t.datetime :created_at, default: Time.zone.now
      t.datetime :updated_at, default: Time.zone.now
    end

    add_foreign_key :recipient_lists, :companies, column: :company_id, primary_key: :id
  end
end
