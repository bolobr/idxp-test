require 'rails_helper'

RSpec.describe Api::V1::ReaderAppController, type: :controller do
  describe "receive_data" do
    it "should assign respective data to terms" do
      headers = { "CONTENT_TYPE" => "application/json" }
      post "/api/v1/receive_data", '{"file_name": "teste4.txt", "file_info": {"teste": 3} }', headers
      expect(response).to eq('{"status": 200, "msg": "teste4.txt inserido"}')
    end

    it "should work async" do
      pending "Wait a bit"
    end
  end

end
