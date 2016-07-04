require 'sidekiq'
require 'pathname'
class Indexer
  include Sidekiq::Worker
  def perform(file_path)
  end

  def count_words(file_path)
    file = File.open(file_path, "r")
    res = {}
    #Lazy for huge files
    file.each_line.lazy.each_with_index do |line, i|
      line_array = line.split
      line_array.each do |key|
        res[key] = (res[key] || 0) + 1
      end
    end
    return res
  end

  def upload_results(file_name, file_info)
  end

  def move_file(file_path)
    oldfile_path  = "application_storage/old_files/#{Pathname.new(file_path).basename}"
    FileUtils.mv(file_path, oldfile_path)
    return oldfile_path
  end
end
