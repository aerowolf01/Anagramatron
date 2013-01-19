#!/usr/bin/env ruby

class Anagram_list
  # Closest word is still possible

  def parse_file(file)
    File.open(file_name).read.each_line do |line|
        line = line.scan(/\w+/)
        @list[line.shift] += line
  end

  def initialize(file_name = nil)
    # Shouldn't keep a file open, or open in write mode
    # TODO: First: add_file, add. Then add: error handling, list metadata.
    @file_name = file_name
    @list = Hash.new { |hash, key| hash[key] = [] } # Epic ruby bug was here, more in readme
    
    if @file_name != nil && File.exists? @file_name
      parse_file(@file_name)
    end
  end

  def alphagram(word)
    # turn word into its alphagram
    word.scan(/[A-z]/).sort.join.downcase
  end

  def save(file = @file_path)
    # after modifying the file in any way it needs to save it.
    listkeys = @list.keys
    f = File.open(file, 'w')
    for key in listkeys
      f.write(key + " " + @list[key].join(" ") + "\n")
    end
    f.close
  end

  def add(word)
    @list[alphagram(word)] << word
  end

  def add_file(f_path)
    # for adding files together
  end

  def search()
    #
  end
