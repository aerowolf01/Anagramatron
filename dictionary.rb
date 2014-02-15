class Dictionary

  attr_reader :dict

  def initialize source
    # what if file and words?
    if source.class == Array
      @dict = source
    elsif File.exists? source
      @dict = File.read(source).split("\n")
    else 
      raise 'Invalid Source!'
    end
  end

  def matching_words words
    words.select { |word| @dict.include? word }
  end
end
