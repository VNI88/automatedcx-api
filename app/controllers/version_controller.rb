class VersionController < ApplicationController
  def show
    render plain: '4.0.0'
  end
end
