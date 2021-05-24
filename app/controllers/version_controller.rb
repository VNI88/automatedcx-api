class VersionController < ApplicationController
  def show
    render plain: 'v7.0.5'
  end
end
