#!/usr/bin/env ruby

class Anagram_list
  # Closest word is still possible

  def initialize(file_name = nil)
    # Shouldn't keep a file open, or open in write mode
    # TODO: First: add_file, add. Then add: error handling, list metadata.
    
    @list = Hash.new { |hash, key| hash[key] = [] } # Epic ruby bug was here, more in readme
    
    if file_name != nil && File.exists? file_name
      File.open(file_name).read.each_line do |line|
        line = line.scan(/\w+/)
        @list[line.shift] = line
    end
  end

  def alphagram(word)
    # turn word into its alphagram
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
    @list[alphagram(word)] << word
    
  end

  def add_file(f_path)
    # for converting whole files
  end

  def search()
    #
  end
