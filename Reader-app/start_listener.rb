require File.expand_path("source/listeners/folder_listener.rb")
require 'listen'

listener = Listen.to('application_storage/new_files') do |added|
  puts "added absolute path: #{added}"
end
listener.start # not blocking
sleep
