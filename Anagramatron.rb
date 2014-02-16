require_relative 'anagrams'
require_relative 'dictionary'

class Anagramatron
  def initialize source
    @dict = Dictionary.new source
  end

  def find_for word
    @dict.matching_words(Anagrams.mutations_for(word))
  end
end
