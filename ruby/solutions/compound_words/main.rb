#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require 'benchmark'
require './trie'
require './compound_word_searcher'

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

# Preprocess dictionary
# Build dictionary word prefix trie with word array for 
# O(l), where l is length of word, lookup time
trie = Trie.new(words)

# Use custom searcher
searcher = CompoundWordSearcher.new

# Benchmark and perform search 
Benchmark.bm do |x|
  x.report {searcher.search(words, trie)}
end


# Sample output
=begin
➜  compound_words git:(master) ✗ ./main.rb words_for_problem.txt
              user     system      total        real
        
The number of compound words in list: 97107

Largest compound words (letter length):
 1. ethylenediaminetetraacetates (28)
 2. electroencephalographically (27)

 19.650000   0.020000  19.670000 ( 19.666621)
=end
