# frozen_string_literal: true

class VersionController < ApplicationController
  def show
    render plain: 'v8.0.0'
  end
end
