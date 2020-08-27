class VersionController < ApplicationController
  def show
    render plain: '4.1.0'
  end
end
