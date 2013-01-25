#!/usr/bin/env ruby

# Author: Cooper LeBrun
# Email: cooperlebrun@gmail.com
# commit notes: added letterhash

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
      parse_file(@file_path, formatted = format)
    elsif @file_path != nil
      raise "#{@file_path} is not a valid file name!"
    end
  end
  
  attr_reader :keys
  attr_reader :list
  attr_accessor :file_path

  def includes? word
    # word = String
    @list[word.alphagram].include? word
  end

  def save(file = @file_path)
    raise "You never defined file! use save(file = your_file_path)" if file == nil
    f = File.open(file, 'w')
    @keys.each { |key| f.write(key + " " + @list[key].join(" ") + "\n") }
    f.close
  end

  def add(word)
    # word = String
    # not really sure what I could use this for, but no reason to delete it.
    @list[word.alphagram] += [word] if not @keys.include? word.alphagram
  end

  def anagram_search(word)
    ag = word.alphagram
    matches = @keys.select { |key| ag.substring? key } #=> list of alphagram keys with < or = numbers of the same letters
    matches.map! { |match| @list[match] } #=> [ the values of the alphagrams from @list ]
    matches.flatten
    # should try combinations of words.
  end

end

class String
  # moved from the AnagramList definition

  def alphagram
    # an alphagram is a word rearranged so its letters are in alphabetical order. for example: aeelmpx
    self.scan(/[A-Z, a-z]/).join.downcase.split("").sort.join # is this not striping out punctuation?
  end

  def letterfreq
    # letter frequency in hash form
    h = Hash.new(0)
    self.split("").each { |l| h[l] += 1 }
    h
  end

  def substring? word # needs a better name
    sfreq = self.letterfreq
    word.letterfreq.each do |letter, frequency|
      if sfreq[letter] < frequency
        return false
        break
      end
    end
    return true
  end
end
