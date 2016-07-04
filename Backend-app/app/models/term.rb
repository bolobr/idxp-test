class Term
  include Mongoid::Document
  field :name, type: String
  embeds_many :processed_files
end
