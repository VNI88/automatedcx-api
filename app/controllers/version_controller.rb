# frozen_string_literal: true

class VersionController < ApplicationController
  def show
    render plain: 'v7.2.2'
  end
end
