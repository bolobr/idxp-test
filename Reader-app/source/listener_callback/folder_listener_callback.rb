require 'fileutils'
require 'pathname'
require File.expand_path("source/workers/indexer.rb")
class FolderListenerCallback
  def initialize

  end

  ##Simple wrapper for the whole process
  def run(file)
    processing_path = self.move_file(file)
    self.call_job(processing_path)
  end

  ##Insert the job on the queue to be processed
  def call_job(file_path)
    job = Indexer.perform_async(file_path)
    return !job.nil?
  end

  ##Move file around to avoid being processed twice
  def move_file(file_path)
    processing_path  = "application_storage/processing_files/#{Pathname.new(file_path).basename}"
    FileUtils.mv(file_path, processing_path)
    return processing_path
  end
end
