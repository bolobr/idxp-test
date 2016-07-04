class ProcessedFile
  include Mongoid::Document
  field :file_name,   type: String
  field :word_count, type: String
  embedded_in :terms

  def self.assert_data(file_name, file_info)
    obj = eval(file_info)
    obj.each do |key, value|
      data = {file_name: file_name, word_count: value}
      word = Term.find_or_create_by(name: key)
      word.processed_files << ProcessedFile.new(data)
    end
  end

end
