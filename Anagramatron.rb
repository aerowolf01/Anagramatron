#!/usr/bin/env ruby

class Anagram_list
  # Closest word is still possible
  def initialize(file_name = nil)
    # Shouldn't keep a file open, or open in write mode
    # TODO: First: add_file, add. Then add: error handling, list metadata.
    
    if file_name == nil
      list = {}
    elsif File.exists? file_name
      @list = File.open(file_name).read.each_line do |line|
    else
        raise "#{file_name} is not a valid file!"
    end
  end

  def alpha_hash(word)
    # turn a word into its alpha value
    word.scan(/[A-z]/).sort.join.downcase
  end

  def save()
    # after modifying the file in any way it needs to save it.
    # needs proper error handling.
  end

  def save_as(f_path)
    # going to need to be able to make a new file.
  end

  def add(word)
    # for individual words
    @list[alpha_word(word)] << word
    
  end

  def add_file(f_path)
    # for converting whole files
  end

  def search()
    #
  end
