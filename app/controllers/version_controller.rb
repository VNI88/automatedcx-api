class VersionController < ApplicationController
  def show
    render plain: AppVersion::LATEST_TAG
  end
end
