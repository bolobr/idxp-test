require File.expand_path("source/listener_callback/folder_listener_callback.rb")
require 'listen'
require 'fileutils'

##Generate folder structure
FileUtils::mkdir_p 'application_storage/new_files'
FileUtils::mkdir_p 'application_storage/processing_files'
FileUtils::mkdir_p 'application_storage/old_files'


##Listener setup
callback = FolderListenerCallback.new
listener = Listen.to('application_storage/new_files') do |modified, added|
  file_list = modified.concat(added)
  file_list.each do |new_file|
    callback.run(new_file)
  end
end

##Listener Start
listener.start # not blocking
sleep
