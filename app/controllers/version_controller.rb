class VersionController < ApplicationController
  def show
    render plain: 'v5.0.0'
  end
end
