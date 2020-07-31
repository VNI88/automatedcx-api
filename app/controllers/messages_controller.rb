class MessagesController < ApplicationController
  def new
    Rails.logger.info(params)
  end
end
