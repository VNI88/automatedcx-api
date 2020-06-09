class VersionController < ApplicationController
  def show
    render plain: Rails.config.application_version
  end
end
