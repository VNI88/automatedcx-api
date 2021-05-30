# frozen_string_literal: true

class VersionController < ApplicationController
  def show
    render plain: 'v7.1.0'
  end
end
