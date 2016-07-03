require 'fileutils'
require 'pathname'
require File.expand_path("source/workers/indexer.rb")
class FolderListenerCallback
  def initialize

  end

  def run(file)
    processing_path = self.move_file(file)
    self.call_job(processing_path)
  end

  def call_job(file_path)
    job = Indexer.perform_async(file_path)
    return !job.nil?
  end

  def move_file(file_path)
    processing_path  = "application_storage/processing_files/#{Pathname.new(file_path).basename}"
    FileUtils.mv(file_path, processing_path)
    return processing_path
  end
end
