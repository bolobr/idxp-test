require 'sidekiq'
require 'pathname'
require 'net/http'
##Server configs
# Sidekiq.configure_server do |config|
#   config.redis = { url: 'redis://redis.example.com:7372/12' }
# end
#
# Sidekiq.configure_client do |config|
#   config.redis = { url: 'redis://redis.example.com:7372/12' }
# end

class Indexer
  include Sidekiq::Worker
  ##Simple wrapper to run everything
  def perform(file_path)
    a = Indexer.new
    file_name = Pathname.new(file_path).basename
    data = a.count_words(file_path)
    a.upload_results(file_name, data)
    a.move_file(file_path)

  end

  ##Indexes the words on a file and return a hash where the keys are words and the value are word count
  def count_words(file_path)
    file = File.open(file_path, "r")
    res = {}
    #Lazy for huge files
    file.each_line.lazy.each_with_index do |line, i|
      line_array = line.split
      line_array.each do |key|
        res[key.downcase] = (res[key.downcase] || 0) + 1
      end
    end
    return res
  end

  ##Interface with Backend
  def upload_results(file_name, file_info)
    uri = URI.parse("http://localhost:3000/api/v1/receive_data.json")
    https = Net::HTTP.new(uri.host, uri.port)
    data = {
      file_name: file_name,
      file_info: file_info
    }
    request = Net::HTTP::Post.new(uri.path)
    request.set_form_data(data)
    response = https.request(request)
    return response.body
  end

  ##File organization
  def move_file(file_path)
    processing_path = "application_storage/processing_files/#{Pathname.new(file_path).basename}"
    oldfile_path  = "application_storage/old_files/#{Pathname.new(file_path).basename}"
    FileUtils.mv(processing_path, oldfile_path)
    return oldfile_path
  end
end
