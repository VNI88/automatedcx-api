# frozen_string_literal: true

module Pdf
  # Class responsible for centralizing basic definitions of the pdf reports
  class Base
    include ActionController::DataStreaming
    def initialize(current_user)
      @current_user = current_user
      @pdf_configuration = {
        page_size: 'A4',
        page_layout: :portrait,
        margin: [40, 75]
      }
    end

    def generate_file_name(file_type)
      @file_name = "#{file_type}_report_#{rand(300_000)}"
    end

    def delete
      File.delete("tmp/#{@file_name}.pdf")
      File.delete("tmp/#{@file_name}.jpg")
    end
  end
end
