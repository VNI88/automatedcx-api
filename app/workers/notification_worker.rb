# typed: true
# frozen_string_literal: true

require 'sidekiq'

# Responsible to send notification through our message senders
class NotificationWorker
  include Sidekiq::Worker

  def perform(routine_id)
    ActiveRecord::Base.transaction do
      @routine = Routine.find(routine_id)
      @recipient_list = @routine.recipient_list
      @message_sender = @routine.message_sender
      @notification = @routine.notification

      Rails.logger.info("Creating sending event for routine_id: #{routine_id}")
      create_sending_event

      send_message

      Rails.logger.info("Update notification - #{@notification.id} - status to: published")
      @notification.update!(status: :publishes)
      @event.update!(finished_at: Time.current)

      Rails.logger.info("Creating service response event for routine_id: #{routine_id}")
      create_service_response_event
    end
  rescue NotificationWorkerError => e
    Sentry.capture_exception(e)
    Rails.logger.error(e)
  end

  private

  def create_sending_event
    Event.create!(
      user_id: @routine.user_id,
      started_at: Time.current,
      name: "immediate_#{@message_sender.name}_notification_sending",
      category: :notification,
      next_event_name: "immediate_#{@message_sender.name}_notification_sending",
      created_at: Time.current,
      recipient_list_id: @recipient_list.id,
      message_sender_id: @message_sender.id
    )
  end

  def send_message
    case @message_sender.name
    when 'facebook'
      send_facebook_message
    when 'email'
      send_email_message
    when 'telegram'
      send_telegram_message
    when 'whatsapp'
      send_whatsapp_message
    end
  end

  def list_with_indifferent_access
    @recipient_list.list.with_indifferent_access
  end

  def send_facebook_message
    list_with_indifferent_access[:contact_data].each do |contact_datum|
      Rails.logger.info("Sending message through facebook for recipient: #{@recipient_list.id}")
      MessageSenders::Facebook.new(contact_datum[:chat_id], contact_datum[:page_id], @routine.notification.message).call
    end
  end

  def send_email_message
    list_with_indifferent_access[:contact_data].each do |contact_datum|
      Rails.logger.info("Sending message through email for recipient: #{@recipient_list.id}")
      MessageSenders::Mailgun.new(
        from: contact_datum[:from],
        to: contact_datum[:to],
        subject: contact_datum.type,
        text: @notification.message
      ).call
    end
  end

  def send_telegram_message
    list_with_indifferent_access[:contact_data].each do |contact_datum|
      Rails.logger.info("Sending message through telegram for recipient: #{@recipient_list.id}")
      MessageSenders::Telegram.new(contact_datum[:chat_id], @routine.notification.message).call
    end
  end

  def send_whatsapp_message
    list_with_indifferent_access[:contact_data].each do |contact_datum|
      Rails.logger.info("Sending message through whatsapp for recipient: #{@recipient_list.id}")
      MessageSenders::Whatsapp.new(contact_datum[:phone], @notification.message).call
    end
  end

  def create_service_response_event
    Event.create!(
      user_id: @routine.user_id,
      started_at: Time.current,
      name: "immediate_#{@message_sender.name}_notification_response",
      category: :notification,
      next_event_name: "immediate_#{@message_sender.name}_notification_response",
      created_at: Time.current,
      finished_at: Time.current,
      recipient_list_id: @recipient_list.id,
      message_sender_id: @message_sender.id
    )
  end
end

class NotificationWorkerError < StandardError; end
