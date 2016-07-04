require 'rails_helper'

RSpec.describe Term, type: :model do
  describe "Relations" do
    before do
      @term = Term.new
    end
    it "Should receive many words and word count" do
      @term.processed_files << ProcessedFile.new
    end
  end
end
