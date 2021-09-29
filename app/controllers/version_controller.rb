# typed: true
# frozen_string_literal: true

class VersionController < ApplicationController
  def show
    render plain: Sentry.release
  end
end
