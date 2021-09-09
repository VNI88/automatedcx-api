# typed: false
require 'swagger_helper'

RSpec.describe "ping_controller", type: :request do
  path "/ping" do
    get "Validate if the app is available" do
      tags "Ping"
      response "200", 'code: 200' do
        run_test!
      end
    end
  end
end

