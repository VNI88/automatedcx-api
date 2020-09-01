class VersionController < ApplicationController
  def show
    render plain: 'v4.3.0'
  end
end
