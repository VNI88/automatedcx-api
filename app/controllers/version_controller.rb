class VersionController < ApplicationController
  def show
    render plain: '4.0.1'
  end
end
