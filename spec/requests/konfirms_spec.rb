require 'rails_helper'

RSpec.describe "Konfirms", type: :request do
  describe "GET /konfirms" do
    it "works! (now write some real specs)" do
      get konfirms_path
      expect(response).to have_http_status(200)
    end
  end
end
