class Anagrams
  def self.of word
    word.split('').permutation.map(&:join) - [word]
  end
end

class Dictionary
end
