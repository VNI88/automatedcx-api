# typed: false
# frozen_string_literal: true

require 'rails_admin/config/actions'
require_relative '../pdf/template/routine_file.rb'
require_relative '../pdf/template/event_file.rb'
require_relative '../pdf/base.rb'

module RailsAdminPdf
end

module RailsAdmin
  module Config
    module Actions
      class ExportPdf < Base
        RailsAdmin::Config::Actions.register(self)

        register_instance_option :member do
         false
        end
        register_instance_option :collection do
          true
        end
        register_instance_option :pjax? do
          false
        end

        register_instance_option :link_icon do
          'fa fa-file-pdf-o'
        end

        register_instance_option :controller do
          Proc.new do
            case self.instance_values['model_name']
            when 'Routine'
              routine_pdf = Pdf::Template::RoutineFile.new(current_user)
              routine_pdf.write

              File.open("tmp/#{routine_pdf.instance_values['file_name']}.pdf", 'r') do |file|
                send_data file.read.force_encoding('BINARY'), :filename => "#{routine_pdf.instance_values['file_name']}.pdf", :type => "application/pdf", :disposition => "attachment"
              end

              routine_pdf.delete
            when 'Event'
              event_pdf = Pdf::Template::EventFile.new(current_user)
              event_pdf.write

              File.open("tmp/#{event_pdf.instance_values['file_name']}.pdf", 'r') do |file|
                send_data file.read.force_encoding('BINARY'), :filename => "#{event_pdf.instance_values['file_name']}.pdf", :type => "application/pdf", :disposition => "attachment"
              end

              event_pdf.delete
            end
          end
        end
      end
    end
  end
end
