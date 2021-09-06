require 'rails_helper'

RSpec.describe "Reviews", type: :request do
  describe "GET /complete" do
    it "returns http success" do
      get "/reviews/complete"
      expect(response).to have_http_status(:success)
    end
  end

end
