class VersionController < ApplicationController
  def show
    render plain: Rails.configuration.application_version
  end
end
