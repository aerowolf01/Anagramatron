class Anagrams

  class WordToLong < StandardError; end

  def self.mutations_for word
    if word.length < 10
      word.split('').permutation.map(&:join) - [word]
    else
      raise WordToLong
    end
  end
end
