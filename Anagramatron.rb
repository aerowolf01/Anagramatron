#!/usr/bin/env ruby

# Author: Cooper LeBrun
# Email: cooperlebrun@gmail.com

class AnagramList < Hash
  # I don't know If I can do sub-words if dictionaries don't have orders.
  def initialize(file_name = nil)
    @file_name = file_name
    @list = Hash.new { |hash, key| hash[key] = [] } # Epic ruby bug was here, more in readme
    if (@file_name != nil) && (File.exists? @file_name)
      # See also: parse_file
      File.open(file_name).read.each_line do |line|
        line = line.scan(/\w+/)
        @list[line.shift] += line
      end
    elsif @file_name != nil
      raise "#{@file_name} is not a valid file name!"
    end
  end
  
  attr_reader :list

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
    word.scan(/[A-Z, a-z]/).sort.join.downcase
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
    # just for a single word
    @list[alphagram(word)] += [word]
  end

  def add_file(file)
    # Only works on files with one word per line.
    File.open(file).read.each_line do |word|
      @list[alphagram(word.chomp)] += [word.chomp]
    end
  end

  def keys()
    @list.keys
  end

  def search()
    # ????????
  end
end
