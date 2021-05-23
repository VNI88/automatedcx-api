# frozen_string_literal: true

class BillingController < ApplicationController
  before_action :authenticate_user!

  def show
    portal_session = current_user.company.payment_processor.billing_portal
    redirect_to portal_session.url
  end
end
