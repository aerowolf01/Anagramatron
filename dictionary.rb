class Dictionary

  attr_reader :dict

  def initialize(args = {:file => false, :words => []})
    @dict = args[:words] if args[:words]
  end

  def matching_words words
    # this loop is an abomination :(
    words.each do |word|
      @dict.select { |entry| entry == word }
    end
  end
end
