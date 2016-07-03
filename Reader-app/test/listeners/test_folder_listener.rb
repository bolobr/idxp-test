require File.expand_path("source/listener_callback/folder_listener_callback.rb")
require 'minitest/autorun'
describe FolderListenerCallback do
  before do
    @listener = FolderListenerCallback.new
  end

  describe "When there is a new file" do
    it "should create a new async job for processing" do
      mock = Minitest::Mock.new
      mock.expect :call
      obj = FolderListener.new
      obj.stub :perform, mock do
        obj.invoke_function("perform")
      end
      mock.verify
    end

    it "should move file to processing folder" do
      skip("Pending")
    end
  end
end
