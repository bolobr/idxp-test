require 'sidekiq'
class Indexer
  include Sidekiq::Worker
  def perform(file_path)
  end
end
