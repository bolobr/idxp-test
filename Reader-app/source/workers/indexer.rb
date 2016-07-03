require 'sidekiq'
class Indexer
  include Sidekiq::Worker
  def perform(file_path)
  end

  def count_words
  end

  def upload_results
  end
end
