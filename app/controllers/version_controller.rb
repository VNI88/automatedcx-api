class VersionController < ApplicationController
  def show
    render plain: 'v4.3.2'
  end
end
