class Term
  include Mongoid::Document
  field :name, type: String
  embeds_many :processed_files

  def self.find_all_files(term)
    a = Term.where(name: term)
    if a.blank?
      return []
    end
    return a[0].processed_files
  end
end
