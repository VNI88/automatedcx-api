class VersionController < ApplicationController
  def show
    render plain: 'v6.0.0'
  end
end
