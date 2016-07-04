require File.expand_path("source/workers/indexer.rb")
require 'minitest/autorun'
describe Indexer do
  before do
    @worker = Indexer.new
    File.open("application_storage/processing_files/teste3.txt", "w") {|f| f.write("teste teste teste") }
    File.open("application_storage/processing_files/teste4.txt", "w") {|f| f.write("teste teste teste") }

  end

  describe "When perform is called" do
    it "should count correctly the terms" do
      a = {}
      a["teste"] = 3
      assert_equal (a), @worker.count_words("application_storage/processing_files/teste3.txt")
    end

    it "should upload the info to the database" do
      a = {status: 200, msg: "File teste4.txt created"}
      data = {}
      data["teste"] = 3
      file_name = "teste4.txt"
      assert_equal (a), @worker.upload_results(file_name, data) 
    end

    it "should move processed files to old files" do
      assert_equal "application_storage/old_files/teste4.txt", @worker.move_file("application_storage/processing_files/teste4.txt")
    end
  end
end
