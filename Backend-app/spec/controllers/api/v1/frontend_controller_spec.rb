require 'rails_helper'

RSpec.describe Api::V1::FrontendController, type: :controller do
  describe "Search" do
    it "Should respond a JSON" do
      get "/api/v1/search_term/teste"
      expect(response.content_type).to eq("application/json")
    end
  end



end
