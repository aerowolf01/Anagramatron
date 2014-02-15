class Anagrams

  class WordToLong < StandardError; end

  def initialize dict
    @dict = dict
  end

  # rename
  def for word
    words = Anagrams.mutations_for word
    @dict.search words
  end

  def self.mutations_for word
    if word.length < 10
      word.split('').permutation.map(&:join) - [word]
    else
      raise WordToLong
    end
  end
end
