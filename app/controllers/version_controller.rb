class VersionController < ApplicationController
  def show
    render plain: 'v7.0.6'
  end
end
