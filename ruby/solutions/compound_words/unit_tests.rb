#!/Users/bcabalo/.rvm/rubies/ruby-1.9.3-p194/bin/ruby

require './trie'
require './compound_word_searcher'
require "test/unit"

class TestCompoundWordSearcher < Test::Unit::TestCase
  DICT_FILE_NAME = "words_for_problem.txt" 

  def setup 
    # Load words from file into memory
    @words = []
    File.open(DICT_FILE_NAME).each do |word|
      word.chomp!
      @words << word
    end

    # Preprocess dictionary
    # Build dictionary word prefix trie with word array for 
    # O(l), where l is length of word, lookup time
    @trie = Trie.new(@words)

    # Use custom searcher
    @searcher = CompoundWordSearcher.new
  end

  def test_basic_compound_words
    word = "aahaa"
    assert_equal(true, @searcher.compound_word?(word, @trie))
    word = "abacaabaab"
    assert_equal(true, @searcher.compound_word?(word, @trie))
    word = "hippopotamusescatxdogcatsratra"
    assert_equal(false, @searcher.compound_word?(word, @trie))
    word = "abalonezymologieszygomorphicabbreviations"
    assert_equal(true, @searcher.compound_word?(word, @trie))
    word = "strawberryyanyan"
    assert_equal(false, @searcher.compound_word?(word, @trie))
  end
=begin
  (0..10).each do |i|
    define_method("test_random_compound_word_#{i}") do
      # Construct a valid compound word with random words from 
      # words list
      compound_word_size = Random.rand(2..3)
      j = 0 
      while j < compound_word_size
        word = "#{word}#{@words[Random.rand(0..@words.length-1)]}"
        j = j + 1
      end
    
      # These constructed compound words should all test to true
      puts "Testing random compound word: #{word}"
      assert_equal(true, @searcher.compound_word?(word, @trie), "Fail word: #{word}")
    end
  end
=end
  def test_generate_random_compound_words 

    max_iterations = 100
    i = 0
    while(i < max_iterations)
      # Construct a valid compound word with random words from 
      # words list
      compound_word_size = Random.rand(2..10)
      j = 0
      while j < compound_word_size
        word = "#{word}#{@words[Random.rand(0..@words.length-1)]}"
        j = j + 1
      end 

      # These constructed compound words should all test to true
      puts "Testing random compound word: #{word}"
      assert_equal(true, @searcher.compound_word?(word, @trie), "Fail word: #{word}")
      i = i + 1
      word = ""
    end
  end
end
