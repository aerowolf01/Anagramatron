#!/usr/bin/env ruby

class Anagram_list
  # Closest word is still possible

  def initialize(file_name = nil)
    @file_name = file_name
    @list = Hash.new { |hash, key| hash[key] = [] } # Epic ruby bug was here, more in readme
    if (@file_name != nil) && (File.exists? @file_name)
      # See also: parse_file
      File.open(file_name).read.each_line do |line|
        line = line.scan(/\w+/)
        @list[line.shift] += line
      end
    end
  end

  def parse_file(file)
    # Entry lines are in the form of
    # alphagram and a space in between each word which has a matching alphagram
    # obviously the above example's matches weren't actually matches, but you get the idea
    # alphagrams are always the first word
    File.open(file_name).read.each_line do |line|
        line = line.scan(/\w+/)
        @list[line.shift] += line
      end
  end

  def alphagram(word)
    # an alphagram is a word rearranged so its letters are in alphabetical order. for example: aeelmpx
    word.scan(/[A-z]/).sort.join.downcase
  end

  def save(file = @file_path)
    # should be called before every exit because any anagram the user enters is\
    # added to the list.
    listkeys = @list.keys
    f = File.open(file, 'w')
    for key in listkeys do
      f.write(key + " " + @list[key].join(" ") + "\n")
    end
    f.close
  end

  def add(word)
    @list[alphagram(word)] += [word]
  end

  def search()
    #
  end
end
