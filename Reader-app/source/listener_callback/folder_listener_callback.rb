require 'fileutils'
require 'pathname'
class FolderListenerCallback
  def initialize

  end

  def run(file)
    processing_path = self.move_file(file)
    self.call_job(processing_path)
  end

  def call_job(file_path)

  end

  def move_file(file_path)
    processing_path  = "application_storage/processing_files/#{Pathname.new(file_path).basename}"
    FileUtils.mv(file_path, processing_path)
    return processing_path
  end
end
