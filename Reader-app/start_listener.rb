require File.expand_path("source/listener_callback/folder_listener_callback.rb")
require 'listen'

callback = FolderListenerCallback.new
listener = Listen.to('application_storage/new_files') do |modified, added|
  file_list = modified.concat(added)
  file_list.each do |new_file|
    callback.run(new_file)
  end
end

listener.start # not blocking
sleep
