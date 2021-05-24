class VersionController < ApplicationController
  def show
    render plain: 'v7.0.4'
  end
end
