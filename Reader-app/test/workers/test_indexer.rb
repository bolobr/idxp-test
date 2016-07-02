require File.expand_path("source/workers/indexer.rb") 
require 'minitest/autorun'
describe Indexer do
  before do
    @worker = Indexer.new
  end

  describe "When perform is called" do
    it "should count correctly the terms" do
      skip("Pending")
    end

    it "should try to upload the info to the Database" do
      skip("Pending")
    end
  end
end
