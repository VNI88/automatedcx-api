# frozen_string_literal: true

class CreateMessageSenders < ActiveRecord::Migration[6.0]
  def change
    create_table :message_senders, id: :serial do |t|
      t.string :name, null: false
      t.datetime :created_at, default: Time.zone.now
      t.datetime :updated_at, default: Time.zone.now
    end

    MessageSender.create!(
      [
        { name: :telegram },
        { name: :email },
        { name: :whatsapp },
        { name: :facebook_messenger }
      ]
    )
  end
end
