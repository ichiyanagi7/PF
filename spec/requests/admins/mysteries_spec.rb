require 'rails_helper'

RSpec.describe "Admins::Mysteries", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/admins/mysteries/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/admins/mysteries/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/admins/mysteries/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
