# typed: false
require 'rails_helper'

RSpec.describe "Chatbot::Whatsapps", type: :request do

  describe "GET /create" do
    it "returns http success" do
      get "/chatbot/whatsapp/create"
      expect(response).to have_http_status(:success)
    end
  end

end
