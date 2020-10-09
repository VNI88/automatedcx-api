class VersionController < ApplicationController
  def show
    render plain: 'v5.1.0'
  end
end
