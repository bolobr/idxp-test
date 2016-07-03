require File.expand_path("source/listener_callback/folder_listener_callback.rb")
require 'minitest/autorun'
describe FolderListenerCallback do
  before do
    @listener = FolderListenerCallback.new
    File.open("application_storage/new_files/teste.txt", "w") {|f| f.write("teste") }
    File.open("application_storage/processing_files/teste2.txt", "w") {|f| f.write("teste") }
  end

  describe "When there is a new file" do
    it "should create a new async job for processing" do
      assert_equal TRUE, @listener.call_job("application_storage/processing_files/teste2.txt")
    end

    it "should move file to processing folder" do
      assert_equal "application_storage/processing_files/teste.txt", @listener.move_file("application_storage/new_files/teste.txt")
    end
  end
end
