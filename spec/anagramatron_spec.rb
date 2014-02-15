require_relative '../anagramatron'

class Dictionary; end

describe Anagrams do
  context 'with a dictionary' do
    
    it "returns (only) 'rom' as an anagram of 'mor'" do 
      @dict = double("Dictionary", :search => 'rom')
      @atron = Anagrams.new(@dict)
      @atron.for('mor').should == 'rom'
    end

    it "returns (only) 'gut' as an anagram of 'tug'" do
      @dict = double("Dictionary", :search => 'gut')
      @atron = Anagrams.new(@dict)
      @atron.for('tug').should == 'gut'
    end
  end

  # rename describe block
  describe 'non-instance methods' do
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
