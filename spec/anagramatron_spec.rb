require_relative '../anagramatron'

class Dictionary; end

describe Anagrams do

  # rename describe block
  describe 'self.mutations_for' do
    it "will make correct permutations of 'mor'" do
      @a = Anagrams.mutations_for "mor"
      @a.should =~ ['orm', 'omr', 'mro', 'rom', 'rmo']

      @a = Anagrams.mutations_for "mod"
      @a.should =~ ['odm', 'omd', 'mdo', 'dom', 'dmo']
    end

    it "won't do words longer then 9 characters" do
      expect { Anagrams.mutations_for "1234567890" }.to raise_error
      expect { Anagrams.mutations_for "123456789" }.not_to raise_error
    end
  end
end
