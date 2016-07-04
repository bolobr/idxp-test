class ProcessedFile
  include Mongoid::Document
  field :file_name,   type: String
  field :world_count, type: String
  embedded_in :words

end
