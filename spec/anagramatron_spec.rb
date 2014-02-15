require_relative '../anagramatron'

# 

describe Anagrams do
  it "will make correct mutations of 'mor'" do
    @a = Anagrams.of "mor"
    @a.should =~ ['orm', 'omr', 'mro', 'rom', 'rmo']

    @a = Anagrams.of "mod"
    @a.should =~ ['odm', 'omd', 'mdo', 'dom', 'dmo']
  end

  it "won't do words longer then 9 characters" do
    expect { Anagrams.of "1234567890" }.to raise_error
    expect { Anagrams.of "123456789" }.not_to raise_error
  end
end

describe Dictionary do
end
