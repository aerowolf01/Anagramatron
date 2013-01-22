#!/usr/bin/env ruby

# Author: Cooper LeBrun
# Email: cooperlebrun@gmail.com
# TODO: make sure there are all methods use the string method of alphagram, and not the class method.

class String
  # Had some of these in the AnagramList class definition, moved them over here.
  def alphagram
    # an alphagram is a word rearranged so its letters are in alphabetical order. for example: aeelmpx
    self.scan(/[A-Z, a-z]/).join.downcase.split("").sort.join
  end
end


class AnagramList < Hash

  def parse_file(file, formatted = false)
    # Entry lines are in the form of;
    # "alphagram and a space in between each word which has a matching alphagram"
    # obviously the above example's matches weren't actually matches, but you get the idea

    if formatted
      # only works with files that have been saved after using this with formatted = false
      File.open(file).read.each_line do |line|
        line = line.scan(/\w+/)
        @list[line.shift] += line
      end

    elsif not formatted
      # formats a file, use with save.
      # Only works on files with one word per line.
    File.open(file).read.each_line do |word|
      @list[word.chomp.alphagram] += [word.chomp] if not includes? word.chomp
      end
    end
    @keys = @list.keys.sort
  end


  def initialize(file_path = nil, format = true)
    @file_path = file_path
    @list = Hash.new { |hash, key| hash[key] = [] } # Epic ruby bug was here, more in readme
    if (@file_path != nil) && (File.exists? @file_path)
      parse_file(@file_path, format)
    elsif @file_path != nil
      raise "#{@file_path} is not a valid file name!"
    end
  end
  
  attr_reader :keys
  attr_reader :list
  attr_accessor :file_path

  def includes? word
    # do I use this anywhere?
    @list[word.alphagram].include? word
  end

  def save(file = @file_path)
    if file == nil
      raise "You never defined file! use save(file = your_file_path)"
    end
    f = File.open(file, 'w')
    @keys.each do |key|
      f.write(key + " " + @list[key].join(" ") + "\n")
    end
    f.close
  end

  def add(word)
    # not really sure what I could use this for, but no reason to delete it.
    # does this work?
    @list[word.alphagram] += [word] if not @keys.include? word.alphagram
  end

  def anagrams_of(word)
    ag = word.alphagram
    notincluded = ("abcdefghijklmnopqrstuvwxyz".split("") - ag.split("")).join
    puts notincluded
    matches = @list.keys.select { |alphagram| alphagram.count(notincluded) < 1 if alphagram != nil}
    p matches
    matches.select! { |match| match.count(ag) > ag.count(ag) }
    p matches
#    matches.each do |match| # not working right now
#      print @list[match]
#    end
  end
end
