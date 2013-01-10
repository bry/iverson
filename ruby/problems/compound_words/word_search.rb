#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require 'benchmark'
require './trie'

######################################################
# Search functions
######################################################

# Check for compounded words with word trie
def compound_word?(word,trie,depth=0)
  depth = depth + 1
  node_ptr = trie.root
  null_node = Node.new("nil")

  if word == "" and depth > 2 
    return true
  else
    # Check the trie and shift the trie pointer for each letter in word
    word.chars.each_with_index do |letter,index|
      char_node = Node.new(letter)

      # Shift trie pointer, check termination marker 
      if node_ptr.children.include?(char_node) and !node_ptr.children.include?(null_node)
        node_ptr = node_ptr.children.fetch(node_ptr.children.index(char_node))
      elsif node_ptr.children.include?(char_node) 
        node_ptr = node_ptr.children.fetch(node_ptr.children.index(char_node))
      else
        return false
      end
      
      # Remove substring and check resulting string on termination markers
      if node_ptr.children.include?(null_node)
        shortened_word = word[index+1..word.length-1]

        if compound_word?(shortened_word, trie, depth)
          return true
        else
          next
        end
      end
    end

    # Check last character termination marker
    if node_ptr.children.include?(Node.new("nil")) and depth > 2 
      return true
    else
      return false
    end
  end
end

# Search for compounded words
# inputs: word list, trie
# outputs: top two lengthiest compound words, runtime benchmarks
def search(words,trie)
  
  compound_word_count = 0
  compound_words = []

  words.each do |word|
    if compound_word?(word,trie)
      compound_words << word
    end
  end

  # Output number of compound words in dictionary
  puts
  puts "The number of compound words in list: " + compound_words.count.to_s
  puts

  # Output first and second largest word found
  largest_word = compound_words.max_by {|w| w.length }
  compound_words.delete(largest_word)
  second_largest_word = compound_words.max_by {|w| w.length } 

  puts "Largest compound words (letter length):"
  puts " 1. #{largest_word} (#{largest_word.length})" 
  puts " 2. #{second_largest_word} (#{second_largest_word.length})" 
  puts
end

######################################################
# Main 
#
# Write a program that reads a file containing a sorted list of words (one
# word per line, no spaces, all lower case), then identifies the longest
# word in the file that can be constructed by concatenating copies of
# shorter words also found in the file.
#
# For example, if the file contained:
#
#       cat
#       cats
#       catsdogcats
#       catxdogcatsrat
#       dog
#       dogcatsdog
#       hippopotamuses
#       rat
#       ratcatdogcat
#
# The answer would be 'ratcatdogcat' - at 12 letters, it is the longest
# word made up of other words in the list.  The program should then
# go on to report how many of the words in the list can be constructed 
# of other words in the list.
######################################################

# Script usage 
if ARGV[0]
  words_filename = ARGV[0]
else
  puts "Usage: ./word_search.rb [filename]"
  exit 
end

# Load words from file into memory
words = []
File.open(words_filename).each do |word|
  word.chomp!
  words << word
end

# Preprocess Dictionary
# Build dictionary word prefix trie with word array for quick word lookup
trie = Trie.new(words)

# Benchmark and perform search 
Benchmark.bm(7) do |x|
  x.report {search(words, trie)}
end


=begin
➜  compound_words git:(master) ✗ ./word_search.rb words_for_problem.txt
              user     system      total        real
        
The number of compound words in list: 97107

Largest compound words (letter length):
 1. ethylenediaminetetraacetates (28)
 2. electroencephalographically (27)

 19.650000   0.020000  19.670000 ( 19.666621)
=end
