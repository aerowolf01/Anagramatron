#!/usr/bin/env ruby

# Author: Cooper LeBrun
# Email: cooperlebrun@gmail.com

# TODO combinations of anagram_search's results
# TODO see if alphagram is stripping out punctuation
# TODO get rid of initializes if/elsif nest. its ugly. and it should feel bad

# should I make a twitter bot for this?

class AnagramList < Hash

  def parse_file(file, formatted = false)
    # Entry lines are in the form of;
    # "alphagram and a space in between each word which has a matching alphagram"
    # obviously the above example's matches weren't actually matches, but you get the idea

    if formatted
      # only works with files that have been saved using the #save method
      File.open(file).read.each_line do |line|
        line = line.scan(/\w+/)
        @list[line.shift] += line
      end
    elsif not formatted
      # formats a file, use with save.
      # Only works on files with one word per line
    File.open(file).read.each_line do |word|
      @list[word.chomp.alphagram] += [word.chomp] if not includes? word.chomp
      end
    end
    @keys = @list.keys.sort
  end

  def initialize(file_path = nil, format = true)
    @file_path = file_path
    @list = Hash.new { |hash, key| hash[key] = [] } # Hash has a bug. more in readme
    # TODO change to case syntax
    if (@file_path != nil) && (File.exists? @file_path)
      parse_file(@file_path, formatted = format)
    elsif @file_path != nil
      raise "#{@file_path} is nil!"
    elsif @file_path.exists? == false
      raise "#{file_path} does not exist."
    end
  end
  
  # some debug stuff
  attr_reader :keys
  attr_reader :list
  attr_accessor :file_path

  def includes? word
    # word = String
    @list[word.alphagram].include? word
  end

  def save(file = @file_path)
    raise "file is undefined" if file == nil
    f = File.open(file, 'w')
    @keys.each { |key| f.write(key + " " + @list[key].join(" ") + "\n") }
    f.close
  end

  def wordlist_save(file)
    raise "file is undefined" if file == nil
    f = File.open(file, 'w')
    @list.values.flatten.each { |v| f.write("#{v}\n") }
    f.close
  end

  def add(word)
    # useless?
    @list[word.alphagram] += [word] if not @keys.include? word.alphagram
  end

  def anagram_search(word)
    ag = word.alphagram
    matches = @keys.select { |key| ag.substring? key } #=> list of alphagram keys with < or = numbers of the same letters
    matches.map! { |match| @list[match] } #=> [ the values of the alphagrams from @list ]
    matches.flatten
  end

end

class String

  def alphagram
    # an alphagram is a word rearranged so its letters are in alphabetical order. for example: aeelmpx
    self.scan(/[A-Z, a-z]/).join.downcase.split("").sort.join # I don't think this is actually striping punctuation
  end

  def letterfreq
    # letter frequency in hash form
    h = Hash.new(0)
    self.split("").each { |l| h[l] += 1 } #=> h = { 'w' => 1, 'o' => 1, 'r' => 1, ... }
    h
  end

  def substring? word # name is a bit misleading
    # counts letters in self, makes sure word doesn't have more letters.
    # returns bool, intended to use with #select
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
