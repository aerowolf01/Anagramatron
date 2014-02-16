require_relative '../Anagramatron'

describe Anagramatron do

  it "finds anagrams" do
    @atron = Anagramatron.new 'dictionary'
    @atron.find_for('washing').should ==['something']
    @atron.find_for('tarroc').should ==['carrot']
  end
end
