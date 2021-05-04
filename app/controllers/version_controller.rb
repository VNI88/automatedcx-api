class VersionController < ApplicationController
  def show
    render plain: 'v6.0.8'
  end
end
