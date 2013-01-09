#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require './trie'

# Script usage 
if ARGV[0]
  words_filename = ARGV[0]
else
  #puts __FILE__
  puts "Usage: ./word_search.rb [filename]"
  exit 
end

# Load words from file into array
words = []
File.open(words_filename).each do |word|
  word.chomp!
  words << word
end

# Preprocess: build dictionary word prefix trie with word array for quick word lookup
trie = Trie.new(words)
# Debug
=begin
trie.root.children.each do |node|
  node.children.each do |secondnode|
    secondnode.children.each do |thirdnode|
      #puts thirdnode.letter
      thirdnode.children.each do |fourthnode|
        puts fourthnode.letter
      end
    end
  end
end
=end

# Search compounded words with word trie
def compound_word?(word,trie)
  return true
end


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

  puts "Largest compound words (length):"
  puts " 1. #{largest_word} (#{largest_word.length})" 
  puts " 2. #{second_largest_word} (#{second_largest_word.length})" 
  puts
end


# Perform search 
search(words, trie)
