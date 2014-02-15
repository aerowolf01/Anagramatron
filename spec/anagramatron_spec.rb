require_relative '../anagramatron'

# 

describe Anagrams do
  it "will make correct mutations of 'mor'" do
    @a = Anagrams.of "mor"
    @a.should =~ ['orm', 'omr', 'mro', 'rom', 'rmo']

    @a = Anagrams.of "mod"
    @a.should =~ ['odm', 'omd', 'mdo', 'dom', 'dmo']
  end

  it "won't do words longer then 13 characters"
end

describe Dictionary do
end
