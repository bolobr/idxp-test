class Term
  include Mongoid::Document
  field :name, type: String
  embeds_many :processed_files

  def self.find_all_files(term)
    a = Term.where(name: term)[0]
    return a.processed_files.to_json(:only => [:file_name, :word_count])
  end
end
