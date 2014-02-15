class Anagrams

  class WordToLong < StandardError; end

  def self.of word
    if word.length < 10
      word.split('').permutation.map(&:join) - [word]
    else
      raise WordToLong
    end
  end
end

class Dictionary
end
