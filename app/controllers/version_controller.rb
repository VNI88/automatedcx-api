class VersionController < ApplicationController
  def show

    render plain: 'v4.2.0'
    
  end
end
