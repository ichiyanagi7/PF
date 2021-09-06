require 'rails_helper'

RSpec.describe "Admins::Genres", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admins/genres/index"
      expect(response).to have_http_status(:success)
    end
  end

end
