class VersionController < ApplicationController
  def show
    render plain: '3.0.0'
  end
end
