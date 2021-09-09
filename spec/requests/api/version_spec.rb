# typed: false
require 'swagger_helper'

RSpec.describe "version_controller", type: :request do
  path "/version" do
    get "Validate the app Version" do
      tags "Version"
      response "200", "v4.0.1" do
        run_test!
      end
    end
  end
end

