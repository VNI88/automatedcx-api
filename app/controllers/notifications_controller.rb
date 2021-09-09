# typed: true
class NotificationsController < ApplicationController
  def new
    Rails.logger.info(params)
  end
end
