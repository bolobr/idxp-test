require File.expand_path("source/listeners/folder_listener.rb")
require 'minitest/autorun'
describe FolderListener do
  before do
    @listener = FolderListener.new
  end

  describe "When there is a new file" do
    it "should create a new async job for processing" do
      skip("Pending")
    end

    it "should move file to processing folder" do
      skip("Pending")
    end
  end
end
