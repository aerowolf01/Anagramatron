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
      @keys = @list.keys.sort
    elsif @file_name != nil
      raise "#{@file_name} is not a valid file name!"
    end
  end
  
  attr_reader :keys

  def alphagram(word)
    # an alphagram is a word rearranged so its letters are in alphabetical order. for example: aeelmpx
    @last_ag = word.scan(/[A-Z, a-z]/).sort.join.downcase
  end

  def includes? word
    @list[alphagram(word)].include? word
  end

  def parse_file(file, formatted = true)
    # Entry lines are in the form of
    # alphagram and a space in between each word which has a matching alphagram
    # obviously the above example's matches weren't actually matches, but you get the idea
    # alphagrams are always the first word
    if formatted
      File.open(file_name).read.each_line do |line|
        line = line.scan(/\w+/)
        ag = line.shift
        for word in line
          @list[ag] += word if not includes? word
        end
      end
    elsif not formatted
      # formats a file, use with save.
      # Only works on files with one word per line.
    File.open(file).read.each_line do |word|
      @list[alphagram(word.chomp)] += [word.chomp] if not includes? word.chomp
      end
    end
    @keys = @list.keys.sort
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
    # not really sure what I could use this for, but maybe someone will find something for this
    @list[alphagram(word)] += [word] if not @list
  end

  def anagrams_of(word)
    { @list[alphagram(word.chomp)] }
  end
end

