# frozen_string_literal: true

# typed: false

require 'rails_admin/config/actions'

module RailsAdminNotificationSender
end

module RailsAdmin
  module Config
    module Actions
      class SendNotificationImediatily < RailsAdmin::Config::Actions::Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :visible? do
          bindings[:object].instance_of?(Routine) &&
            bindings[:object].periodicity.include?('unique') &&
            bindings[:object].name.include?('send_notification')
        end

        register_instance_option :member do
          true
        end

        register_instance_option :collection do
          false
        end

        register_instance_option :pjax? do
          false
        end

        register_instance_option :link_icon do
          'far fa-comments'
        end

        register_instance_option :controller do
          proc do
            NotificationWorker.perform_async(@object.id)
            redirect_to back_or_index
          end
        end
      end
    end
  end
end
